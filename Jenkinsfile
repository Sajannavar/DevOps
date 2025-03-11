pipeline{
    agent any

    stages{
        stage('Build-in Veriables'){
            steps{
                echo "Job Number : ${env.BUILD_NUMBER}"
                echo "Job Name : ${env.JOB_NAME}"
            }
        }
    }
}