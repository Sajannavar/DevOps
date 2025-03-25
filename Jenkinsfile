pipeline {
    agent any
    
    stages {
        stage('Check CPU and Memory Usage') {
            steps {
                script {
                    sh 'echo "CPU Load:" && uptime'
                    sh 'echo "Memory Usage:" && free -h'
                }
            }
        }
        
        stage('Check Disk Space') {
            steps {
                script {
                    sh 'echo "Disk Usage:" && df -h'
                }
            }
        }
        
        stage('Check Running Services') {
            steps {
                script {
                    sh 'echo "Active Services:" && systemctl list-units --type=service --state=running'
                }
            }
        }
        
        stage('Check System Uptime') {
            steps {
                script {
                    sh 'echo "System Uptime:" && uptime -p'
                }
            }
        }
        
        stage('Generate Report') {
            steps {
                script {
                    sh 'echo "System Health Check Completed" > health_report.txt'
                    sh 'uptime >> health_report.txt'
                    sh 'free -h >> health_report.txt'
                    sh 'df -h >> health_report.txt'
                    sh 'systemctl list-units --type=service --state=running >> health_report.txt'
                    sh 'uptime -p >> health_report.txt'
                }
            }
        }
    }
    
    post {
        always {
            archiveArtifacts artifacts: 'health_report.txt', fingerprint: true
        }
    }
}
