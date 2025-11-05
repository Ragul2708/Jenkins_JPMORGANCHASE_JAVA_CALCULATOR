pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'feature/java_calculator', url: 'https://github.com/Ragul2708/Jenkins_JPMORGANCHASE_JAVA_CALCULATOR.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package spring-boot:repackage'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ragul18/calculator-app:latest .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker rm -f calculator-app || true
                docker run -d -p 9090:8080 --name calculator-app ragul18/calculator-app:latest
                '''
            }
        }
    }
}
