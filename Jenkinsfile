pipeline {
    agent any
    
    environment {
        SSH_CREDENTIALS_ID = 'your-ssh-credentials-id'  // Replace with Jenkins credentials ID
        SERVERS = "server1.example.com server2.example.com"  // Replace with your server list
    }
    
    stages {
        stage('Check for Updates') {
            steps {
                script {
                    for (server in SERVERS.split()) {
                        echo "Checking updates on ${server}"
                        sshCommand remote: [
                            host: server,
                            credentialsId: SSH_CREDENTIALS_ID,
                            user: 'ubuntu' // Change if needed
                        ], command: 'sudo apt update && sudo apt list --upgradable'
                    }
                }
            }
        }
        
        stage('Upgrade Packages') {
            steps {
                script {
                    for (server in SERVERS.split()) {
                        echo "Upgrading packages on ${server}"
                        sshCommand remote: [
                            host: server,
                            credentialsId: SSH_CREDENTIALS_ID,
                            user: 'ubuntu' // Change if needed
                        ], command: 'sudo apt upgrade -y && sudo apt autoremove -y'
                    }
                }
            }
        }
    }
    
    post {
        success {
            echo 'Update and upgrade completed successfully!'
        }
        failure {
            echo 'Something went wrong! Check the logs.'
        }
    }
}
// This Jenkinsfile automates the process of checking for updates and upgrading packages on multiple servers using SSH.
// It uses the Jenkins SSH plugin to execute commands on remote servers.