properties([parameters([choice(choices: ['us-east-2', 'us-east-1', 'us-west-1'], description: 'Select in which region you want to deploy the resource ??', name: 'rg_location')])])
pipeline{
    
    agent any 
    environment {
       // Define environment variables for Azure credentials
        ARM_SUBSCRIPTION_ID = "3d193e7b-bd4f-4cb1-becb-e31d4d51e3aa"
        ARM_TENANT_ID = "87fa2b03-576c-440b-93a5-b22dbb2e0c6d"
        ARM_CLIENT_ID = "7d605a47-2fd4-434b-9dbc-13b4b86dfca0"
        ARM_CLIENT_SECRET = "y5C8Q~CY4PP4m2LWo~-aY2wiegfSr0Gj_GDmdac5"
    }
    stages{
        
        stage('git checkout'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/git01h/terraform02_repo.git'
            }
        }
        stage('terraform init'){
            steps{
                sh 'terraform init'
            }
        }
         stage('terraform plan'){
            steps{
                sh "terraform plan -var 'rg_location=${params.rg_location}'"
            }
        }
         stage('terraform apply'){
            steps{
                 sh "terraform apply -var 'rg_location=${params.rg_location}' --auto-approve"
            }
        }
        stage('terraform destroy'){
            steps{
              sh "terraform destroy -var 'rg_location=${params.rg_location}' --auto-approve"
            }
        }
    }
}
