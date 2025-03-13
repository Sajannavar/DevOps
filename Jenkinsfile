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
        stage('Docker Pull Nginx Image'){
            steps{
                sh 'docker pull nginx'
            }
        }
        stage('Docker Run Nginx Container'){
            steps{
                sh 'docker run -d -p 8080:80 --name mynginx nginx'
            }   
        }
    }
}