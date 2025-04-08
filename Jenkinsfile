pipeline{
    agent any
    stages {
        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }
    }
    post {
        always {
            echo 'This will always run after the stages.'
        }
    }
}