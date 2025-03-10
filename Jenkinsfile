pipeline{
    agent any
    parameters{
        string name: 'First_Name'
    }

    stages{
        stage('Stage'){
            steps{
                echo "My name is $params.First_Name"
            }
        }
    }
}
