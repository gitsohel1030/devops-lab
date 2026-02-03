pipeline {
    agent any

    tools {
        terraform 'terraform-1.6'
    }

    triggers {
        githubPush()
    }

    environment {
        AWS_DEFAULT_REGION = "ap-south-1"
        TF_ENV = "terraform/tf-aws-project/envs/prod"
    }

    options {
        disableConcurrentBuilds()
        timestamps()
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        
        stage('Cleanup TF Cache') {
            steps {
                dir("${TF_ENV}") {
                sh '''
                    rm -rf .terraform .terraform.lock.hcl
                    echo "Cleaned previous Terraform backend cache"
                '''
                }
            }
        }


        stage('Terraform Init') {
            steps {
                dir("${TF_ENV}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Format Check') {
            steps {
                dir("${TF_ENV}") {
                    sh 'terraform fmt -recursive -no-color'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${TF_ENV}") {
                    sh 'terraform validate'
                }
            }
        }

        stage('Iac Security Scans') {
            steps {
                dir("${TF_ENV}") {
                    sh 'tfsec .'
                }
            }
        }

        stage('Manual Approval') {
            steps {
                input message: "Are you sure you want to execute traaform plan?"
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_ENV}") {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }
    }

    post {
        success {
            echo "Terraform init, fmt, and plan completed successfully."
        }
        failure {
            echo "Terraform pipeline failed. Check logs."
        }
        
        always {
            cleanWs()   // cleans the entire workspace after each run
        }

    }
}