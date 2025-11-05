pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'feature/java_calculator', url: 'https://github.com/Ragul2708/Jenkins_JPMORGANCHASE_JAVA_CALCULATOR.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Verify JAR') {
            steps {
                sh 'ls -lh target/'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build --no-cache -t ragul18/calculator-app:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                script {
                    sh '''
                    if [ "$(docker ps -aq -f name=calculator-app)" ]; then
                        docker rm -f calculator-app || true
                    fi
                    '''
                }
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d --name calculator-app -p 9090:8080 ragul18/calculator-app:latest'
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Success — Access at http://<EC2-Public-IP>:9090"
        }
        failure {
            echo "❌ Deployment Failed — Check Jenkins logs."
        }
    }
}
