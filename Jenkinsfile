pipeline {
    agent any
    
    environment {
        BUILD_DIR = 'build_output'
    }
    
    stages {
        // Stage 1: Checkout the code from GitHub
        stage('Checkout') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/Sajannavar/DevOps.git'                
            }
        }

        // Stage 2: System Information
        stage('System Info') {
            steps {
                script {
                    def osName = sh(script: 'uname -a', returnStdout: true).trim()
                    echo "Running on OS: ${osName}"
                    def jenkinsNode = env.NODE_NAME
                    echo "Running on Node: ${jenkinsNode}"                    
                }
            }
        }

        // Stage 3: Build the Project
        stage('Build') {
            steps {
                echo 'Starting the build process...'
                sh '''
                    mkdir -p ${BUILD_DIR}
                    echo "Building project..." > ${BUILD_DIR}/output.txt                    
                '''               
            }
        }

        // Stage 4: Run Tests
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh '''
                    echo "Simulating tests..."
                    
                    echo "Tests completed successfully."
                '''
            }
        }

        // Stage 5: Archive Artifacts (Save build outputs)
        stage('Archive Artifacts') {
            steps {
                echo 'Archiving artifacts...'
                archiveArtifacts artifacts: "${BUILD_DIR}/*", fingerprint: true                
            }
        }
    }

    // Post Actions: Run these after all stages
    post {
        success {
            echo 'Build SUCCESSFUL!'
            sh 'echo "Build completed at $(date)"'
        }
        failure {
            echo 'Build FAILED!'
        }
        always {
            echo 'Build finished. Cleaning up...'
            sh 'rm -rf ${BUILD_DIR}'
        }
    }
}