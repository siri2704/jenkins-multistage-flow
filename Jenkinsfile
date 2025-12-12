pipeline {
    agent any
    
    stages {
        stage('Collect') {
            steps {
                sh 'python3 collector.py'
            }
        }
        
        stage('Parse and Validate') {
            parallel {
                stage('Parse') {
                    steps {
                        sh 'python3 parser.py'
                    }
                }
                stage('Validate') {
                    steps {
                        sh 'python3 validator.py'
                    }
                }
            }
        }
        
        stage('Summarize') {
            steps {
                sh 'python3 summary.py'
            }
        }
        
        stage('Verify Summary') {
            steps {
                script {
                    def summary = readFile('summary_output.txt').trim()
                    if (summary.isEmpty()) {
                        error("Summary output is empty!")
                    }
                }
            }
        }
    }
    
    post {
        always {
            archiveArtifacts artifacts: '*.txt', allowEmptyArchive: true
        }
    }
}
