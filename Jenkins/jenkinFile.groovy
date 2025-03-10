pipeline {
    agent any

    stages {
        stage('Backup') {
            steps {
                echo "Backing up files..."
            }
        }        
    }

    post {
        always {
            echo "File transfer process completed."
        }
    }
}
