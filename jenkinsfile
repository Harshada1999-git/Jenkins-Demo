pipeline {
    agent any

    environment {
        TF_VERSION = "1.6.0"   // Specify your Terraform version
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/Harshada1999-git/Jenkins-Demo.git'
            }
        }

        stage('Install Terraform') {
            steps {
                sh '''
                  # Download and install Terraform
                  curl -fsSL https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip -o terraform.zip
                  unzip terraform.zip
                  sudo mv terraform /usr/local/bin/
                  terraform -version
                '''
            }
        }

        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Apply') {
            when {
                branch 'main'  // Only apply on main branch
            }
            steps {
                input message: 'Approve to Apply?', ok: 'Apply'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
