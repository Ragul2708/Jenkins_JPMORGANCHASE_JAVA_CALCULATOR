pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build --no-cache -t ragul18/calculator-app:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker stop calculator-app || true
                docker rm calculator-app || true
                docker run -d --name calculator-app -p 9090:8080 ragul18/calculator-app:latest
                '''
            }
        }
    }
}
