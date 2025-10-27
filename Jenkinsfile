pipeline {
    agent any

    environment {
        IMAGE_NAME = 'mohdayazz/docker-python-project'
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/mohdayaz06/Docker-Python-Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Optional: stop old container if exists before running a new one
                    sh '''
                    docker ps -q --filter "ancestor=${IMAGE_NAME}:latest" | xargs -r docker stop
                    docker run -d -p 5000:5000 ${IMAGE_NAME}:latest
                    '''
                }
            }
        }
    }
}
