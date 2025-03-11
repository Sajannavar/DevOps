pipeline{
    agent any

    stages{
        stage('Execute Shell Script'){
            steps{
                sh '''
                chmod +x ./script.sh
                ./script.sh
                '''
            }
        }
    }
}