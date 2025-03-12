def greet(name) {
    echo "Hello, ${name}"
}

pipeline{
    agent any
    stages{
        stage('Greet'){
            steps{
                script{
                    greet('Jenkins')
                }
            }
        }
    }
}