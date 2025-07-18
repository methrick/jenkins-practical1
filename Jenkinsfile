pipeline {
    agent any

    environment {
         AWS_CREDENTIALS_ID = credentials'c27697ce-6a84-427b-8415-6f2efc2f4bcf''  
    }



    stages {
        stage('Checkout Terraform Code') {
            steps {
                git branch: 'main',
                   
                    url: 'https://github.com/methrick/jenkins-practical1.git'
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
