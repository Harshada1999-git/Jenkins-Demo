pipeline {
    agent any

    environment {
        TF_VERSION = "6.43.0"   // Specify your Terraform version
    }

   stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Harshada1999-git/Jenkins-Demo.git'
            }
        }

        stage('Install Terraform') {
            steps {
                sh '''
                  echo "Downloading Terraform ${TF_VERSION}..."
                  curl -fsSL https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip -o terraform.zip
                  unzip terraform.zip
                  chmod +x terraform
                  mkdir -p $HOME/bin
                  mv terraform $HOME/bin/
                  export PATH=$HOME/bin:$PATH
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
                branch 'main'  // Only applies if building main branch
            }
            steps {
                input message: 'Approve to Apply?', ok: 'Apply'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
