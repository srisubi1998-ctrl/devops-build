pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'dev', url: 'https://github.com/srisubi1998-ctrl/devops-build.git'
            }
        }
        stage('Build React App') {
            steps {
                sh '''
                    if [ -f package.json ]; then
                        npm install
                        npm run build
                    fi
                '''
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t subitcha1998/dev:latest .'
            }
        }
        stage('Push to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials-id', passwordVariable: 'DOCKER_PSW', usernameVariable: 'DOCKER_USR')]) {
                    sh 'echo $DOCKER_PSW | docker login -u $DOCKER_USR --password-stdin'
                    sh 'docker tag subitcha1998/dev:latest subitcha1998/prod:latest'
                    sh 'docker push subitcha1998/prod:latest'
                }
            }
        }
        stage('Deploy to EC2') {
            steps {
                sh 'chmod +x deploy.sh && ./deploy.sh'
            }
        }
    }
}
