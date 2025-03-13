pipeline{
    agent any

    stages{
        stage('Docker Version'){
            steps{
                sh 'docker --version'
            }
        }
        stage('Docker Info'){
            steps{
                sh 'docker info'
            }
        }
        stage('Docker Build Nginx Image'){
            steps{
                sh 'docker build -t nginx-image .'
            }
        }
    }
}