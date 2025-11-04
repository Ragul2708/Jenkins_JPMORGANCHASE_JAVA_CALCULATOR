pipeline {
    agent { label 'Jenkinsworker' }


    environment {
        JAR_NAME = "calculator-1.0-SNAPSHOT.jar"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-repo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Verify JAR') {
            steps {
                // List JAR contents and check for Calculator.class
                sh """
                echo "Verifying JAR contents..."
                jar tf target/${JAR_NAME} | grep 'com/example/Calculator.class' || {
                    echo 'ERROR: Calculator.class not found in JAR!'
                    exit 1
                }
                echo 'JAR verification passed.'
                """
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                docker build -t ragul18/calculator-app:latest .
                """
            }
        }

        stage('Run Docker Container') {
            steps {
                sh """
                docker run -d -p 9090:8080 ragul18/calculator-app:latest
                """
            }
        }
    }
}
