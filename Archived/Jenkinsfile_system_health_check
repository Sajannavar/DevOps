pipeline {
    agent any
    
    // environment {
    //     ALERT_EMAIL = ''
    // }
    
    stages {
        stage('System Health Check') {
            parallel {
                stage('Check CPU & Memory') {
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
                
                stage('Check Uptime') {
                    steps {
                        script {
                            sh 'echo "System Uptime:" && uptime -p'
                        }
                    }
                }
            }
        }
        
        stage('Monitor System Logs') {
            steps {
                script {
                    sh 'echo "Checking system logs for errors..."'
                    sh 'grep -i "error" /var/log/syslog | tail -n 10 > log_errors.txt || echo "No errors found"'
                }
            }
        }
        
        stage('Security Scan') {
            steps {
                script {
                    sh 'echo "Running security scan..."'
                    sh 'sudo apt update && sudo apt list --upgradable > security_updates.txt'
                }
            }
        }
        
        stage('Generate Report & Send Alert') {
            steps {
                script {
                    sh 'echo "System Health Report" > health_report.txt'
                    sh 'uptime >> health_report.txt'
                    sh 'free -h >> health_report.txt'
                    sh 'df -h >> health_report.txt'
                    sh 'uptime -p >> health_report.txt'
                    cat health_report.txt >> log_errors.txt
                    cat security_updates.txt >> log_errors.txt
                    
                    // sh 'if grep -q "error" log_errors.txt; then echo "System issues found! Sending alert..." && echo "System issues detected on Jenkins node!" | mail -s "ALERT: System Issues" $ALERT_EMAIL; fi'
                }
            }
        }
    }
    
    post {
        always {
            archiveArtifacts artifacts: 'health_report.txt, log_errors.txt, security_updates.txt', fingerprint: true
        }
    }
}
