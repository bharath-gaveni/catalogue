pipeline {
    agent {
        node {
        label 'JENKINS-AGENT-1'
        }
    }

    environment {
        version=""
    }

    stages {
        stage('Read version') {
            steps {
                script {
                echo "Building"
                 def packageJSON = readJSON file: 'package.json'
                    version = packageJSON.version
                 echo "VERSION: ${version}"
                }
        }
        }

        stage('Install dependencies') {
            steps {
                script {
                    sh """
                    npm install
                    """
                }
            }
        }

        stage('Build the image') {
            steps {
                script {
                    sh """
                    docker build -t catalogue:${version} .
                    """
                }
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