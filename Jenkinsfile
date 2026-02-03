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
        REPO_PATH = "terraform/tf-aws-project/envs"
        TF_ENV = "prod"
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
                dir("${REPO_PATH}/${TF_ENV}") {
                sh '''
                    rm -rf .terraform 
                    echo "Cleaned previous Terraform backend cache"
                '''
                }
            }
        }


        stage('Terraform Init') {
            steps {
                dir("${REPO_PATH}/${TF_ENV}") {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Format Check') {
            steps {
                dir("${REPO_PATH}/${TF_ENV}") {
                    sh 'terraform fmt -recursive -no-color'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${REPO_PATH}/${TF_ENV}") {
                    sh 'terraform validate'
                }
            }
        }

        // stage('Iac Security Scans') {
        //     steps {
        //         dir("${TF_ENV}") {
        //             sh 'tfsec .'
        //         }
        //     }
        // }

        stage('Manual Approval') {
            steps {
                input message: "Are you sure you want to execute traaform plan?"
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${REPO_PATH}/${TF_ENV}") {
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