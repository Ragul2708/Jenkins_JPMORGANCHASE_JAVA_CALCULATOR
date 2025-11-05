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
                sh 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ragul18/calculator-app:latest .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker rm -f calculator-app || true'
                sh 'docker run -d -p 8080:8080 --name calculator-app ragul18/calculator-app:latest'
            }
        }
    }
}
