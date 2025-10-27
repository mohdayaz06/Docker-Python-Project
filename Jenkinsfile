pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/mohdayazz/Docker-Python-Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('mohdayazz/docker-python-project')
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([ credentialsId: 'dockerhub-credentials', url: '' ]) {
                    script {
                        docker.image('mohdayazz/docker-python-project').push('latest')
                    }
                }
            }
        }
    }
}
