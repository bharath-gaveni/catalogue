pipeline {
    agent {
        node {
        label 'JENKINS-AGENT-1'
        }
    }

    environment {
        version=""
        ACC_ID="478810312299"
        project="roboshop"
        component="catalogue"
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

        stage('Unit Test') {
            steps {
                script {
                    sh """
                    npm run
                    """
                }
            }
        }

        stage('Build the image') {
            steps {
                script {
                    withAWS(region:'us-east-1',credentials:'aws-cred') {
                        sh """
                        aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com
                        docker build -t ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com/${project}/${component}:${version} .
                        docker images
                        docker push ${ACC_ID}.dkr.ecr.us-east-1.amazonaws.com/${project}/${component}:${version}
                        """
}
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