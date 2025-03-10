pipeline{
    agent any

    stages{
        stage('Stage'){
            steps{
                sh 'systemctl status jenkins'
                sh 'echo $USER'
            }
        }
        stage('Build'){
            steps{
                echo "Build Stage"
            }
        }
        stage('Test'){
            steps{
                echo "Test Stage"
            }
        }
    }
}
