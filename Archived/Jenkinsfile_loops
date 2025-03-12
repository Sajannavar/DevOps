pipeline{
    agent any
    stages{
        stage('Loops Usage'){
            steps{
                script{
                    echo "Table of 5"
                    for (int i = 1; i <= 10; i++){
                        echo "10 * ${i} = ${10 * i}"
                    }
                }
            }
        }
    }
}