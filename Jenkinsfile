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
        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dockerhub-credential', url: 'https://registry.hub.docker.com']) {
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
        stage('Terraform Init') {
            steps {
                script {
                    withEnv(["GOOGLE_APPLICATION_CREDENTIALS=${env.GCP_CREDENTIALS}"]) {
                        sh 'terraform init'
                    }
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    withEnv(["GOOGLE_APPLICATION_CREDENTIALS=${env.GCP_CREDENTIALS}"]) {
                        sh 'terraform plan -out=tfplan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    withEnv(["GOOGLE_APPLICATION_CREDENTIALS=${env.GCP_CREDENTIALS}"]) {
                        sh 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                script {
                    sh """
                        ansible-playbook deploy_docker.yml -e "docker_image=${DOCKER_IMAGE}"
                    """
                }
            }
    }
    }
}
