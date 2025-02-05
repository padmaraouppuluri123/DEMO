pipeline {
    agent any
    environment {
        REPO_URL = 'https://github.com/padmaraouppuluri123/DEMO.git'
        DOCKER_IMAGE = 'padmaraouppuluri/padmaraodocker:image'  // Docker image in Docker Hub
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: "${REPO_URL}"
            }
        }
        stage('Build Maven Project') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${DOCKER_IMAGE} .'
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    // Login to Docker Hub using your credentials
                    withDockerRegistry([credentialsId: 'dockerhub-credential', url: 'https://registry.hub.docker.com']) {
                    sh 'docker login -u padmaraouppuluri -p Welcome@123'
                }
                }  
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Push the image to Docker Hub
                    sh 'docker push ${DOCKER_IMAGE}'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 8083:8080 ${DOCKER_IMAGE}'
            }
        }
    }
}
