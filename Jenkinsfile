def greet(name) {
    echo "Hello, ${name}"
}
def call(body) {
    body.resolveStrategy = Closure.DELEGATE_FIRST
    body.delegate = this
    body()
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
        stage('Call'){
            steps{
                call{
                    greet('Jenkins')
                }
            }
        }
    }
}