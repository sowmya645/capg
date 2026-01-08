pipeline {
    agent any

    tools {
        jdk 'jdk11'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                echo 'Repository checked out successfully'
            }
        }

        stage('Build') {
            steps {
                echo 'Building application...'
                sh 'chmod +x build.sh'
                sh './build.sh'
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                sh 'java -cp src/main/java:src/test/java com.example.HelloDevOpsTest'
            }
        }

        stage('Archive') {
            steps {
                echo 'Archiving artifacts...'
                archiveArtifacts artifacts: 'app.jar, build.sh', fingerprint: true
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
            cleanWs()
        }
    }
}
