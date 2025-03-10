pipeline{
    agent any
    environment{
        BACKUP_SUFFIX = new Date().format("yyyyMMdd_HHmm")
    }
    stages{
        stage('Stage'){
            steps{
                echo env.BACKUP_SUFFIX
            }
        }
    }
}
