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

        stage('Terraform Plan') {
            steps {
                dir("${TF_ENV}") {
                    sh 'terraform plan'
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
    }
}