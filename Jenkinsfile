pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        IMAGE_NAME = "mohdayazz/python-project"
        AWS_CREDS = credentials('aws-eks')
    }

    stages {

        stage('Clone Code') {
            steps {
                git branch: 'main', url: 'https://github.com/mohdayaz06/Docker-Python-Project'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$BUILD_NUMBER .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh '''
                echo $DOCKERHUB_CREDENTIALS_PSW | docker login \
                    -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                '''
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$BUILD_NUMBER'
            }
        }

        stage('Configure AWS') {
            steps {
                sh '''
                aws configure set aws_access_key_id $AWS_CREDS_USR
                aws configure set aws_secret_access_key $AWS_CREDS_PSW
                aws configure set default.region ap-south-1

                aws eks update-kubeconfig --name tecnovators-cluster --region ap-south-1
                '''
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh 'kubectl apply -f Deployment.yaml'
                sh 'kubectl apply -f Service.yaml'
            }
        }

    }
}
