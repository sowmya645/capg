pipeline {
    agent any 
    tools { 
        jdk 'jdk-21'  // Make sure JDK is configured in Jenkins 
    }
    stages { 
        stage('Checkout') { 
            steps { 
                git branch: 'master', 
                    url: 'https://github.com/sowmya645/capg.git'  // Update path 
                echo 'Repository cloned successfully' 
            } 
        } 
        stage('Build') { 
            steps { 
                echo 'Building application...' 
                sh 'chmod +x ./build.sh'
                sh './build.sh' 
            } 
        } 
        stage('Test') { 
            steps { 
                echo 'Running tests...' 
                sh 'java -cp build/classes com.example.HelloDevOpsTest' 
            } 
        } 
        stage('Archive') { 
            steps { 
                echo 'Archiving artifacts...' 
                archiveArtifacts artifacts: 'app.jar', fingerprint: true 
                archiveArtifacts artifacts: 'build.sh', fingerprint: true 
            } 
        } 
    }
    post {
        always { 
            echo 'Pipeline completed' 
            cleanWs()  // Clean workspace 
        } 
    }
}