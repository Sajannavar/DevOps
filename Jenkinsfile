pipeline{
    agent any
    // parameters{
    //     string name: 'First_Name'
    // }

    stages{
        stage('Stage'){
            steps{
                echo "Hello World"
            }
        }
    }
    post actions{
        always{
            echo "This is the end of the pipeline"
        }
        success{
            echo "The pipeline was successful"
        }
        failure{
            echo "The pipeline failed"
        }
    }
}
