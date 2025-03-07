pipeline {
    agent any

    environment {
        SOURCE_HOST = "${env.SOURCE_HOST}"
        DEST_HOSTS = ""${env.DEST_HOSTS}".trim().split(/\s*,\s*|\s+/)"
        USER = "${env.USER}"
        SOURCE_FILE = "${env.SOURCE_FILE}"
        DEST_PATH = "${env.DEST_PATH}"
        BACKUP_SUFFIX = new Date().format("yyyyMMdd_HHmm")
    }

    stages {
        stage('Backup Existing Files') {
            steps {
                script {
                    DEST_HOSTS.each { destHost ->
                        echo "Backing up file on ${destHost}..."
                        def backupCmd = "ssh ${USER}@${destHost} '[ -f ${DEST_PATH}${SOURCE_FILE.tokenize('/').last()} ] && cp ${DEST_PATH}${SOURCE_FILE.tokenize('/').last()} ${DEST_PATH}${SOURCE_FILE.tokenize('/').last()}_backup_${BACKUP_SUFFIX} || echo \"No existing file to backup.\"'"
                        sh backupCmd
                    }
                }
            }
        }

        stage('Transfer Files') {
            steps {
                script {
                    DEST_HOSTS.each { destHost ->
                        echo "Transferring file to ${destHost}..."
                        def transferCmd = "scp ${SOURCE_FILE} ${USER}@${destHost}:${DEST_PATH}"
                        def transferStatus = sh(script: transferCmd, returnStatus: true)

                        if (transferStatus == 0) {
                            echo "Transfer to ${destHost} successful"
                        } else {
                            echo "Transfer to ${destHost} failed"
                        }
                    }
                }
            }
        }
    }

    post {
        always {
            echo "File transfer process completed."
        }
    }
}
