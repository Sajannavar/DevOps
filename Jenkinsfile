pipeline{
    agent any

    stages{
        stage('Stage'){
            steps{
                systemctl status jenkins
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
