pipeline {
    agent any

    environment {
        IMAGE_NAME = 'mohdayazz/docker-python-project'
    }

    stages {
        stage('Clone') {
            steps {
                // ✅ Use correct GitHub URL
                git branch: 'main', url: 'https://github.com/mohdayaz06/Docker-Python-Project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // ✅ Save built image reference for pushing
                    dockerImage = docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // ✅ URL must be Docker Hub's registry
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
