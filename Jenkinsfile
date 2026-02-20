pipeline {
    agent {
        node {
        label 'JENKINS-AGENT-1'
        }
    }

    stages {
        stage('01-Build') {
            steps {
                echo "Building"
            }
        }
        stage('02-Test') {
            steps{
                echo "Testing"
            }
        }
            stage('03-Deploy') {
                steps {
                    echo "Deploying"
                }
            }
    }
        }