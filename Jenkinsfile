pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        TF_VERSION = '1.6.0'
    }



    stages {
        stage('Checkout Terraform Code') {
            steps {
                git branch: 'main',
                   
                    url: 'https://github.com/methrick/jenkins-practical1.git'
            }
        }

        stage('Setup AWS Credentials') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'c27697ce-6a84-427b-8415-6f2efc2f4bcf']]) {
                    sh '''
                        export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                        export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                        export AWS_DEFAULT_REGION=${AWS_REGION}
                        echo "AWS Credentials Set"
                    '''
                }
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Do you want to apply Terraform changes?"
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        failure {
            echo 'Pipeline failed.'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
    }
}
