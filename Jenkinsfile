properties([parameters([choice(name: 'ACTION', choices: ['Plan', 'Apply', 'Destroy'], description: 'Select Terraform Action')])])
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
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/git01h/terraform02_repo.git']])
                    }
        }
        
        stage('terraform init'){
            steps{
                sh 'terraform init'
                
            }
        }
        stage('Terraform Action') {
            steps {
                script {
                    switch (params.ACTION) {
                        case 'Plan':
                        stage('Terraform plan') {
            steps {
                script {
                            sh 'terraform plan'
                            
                }
            }
                        
                    switch (params.ACTION) {
                        case 'Apply':
                    stage('Terraform Apply') {
            steps {
                script {
                            sh 'terraform plan -out=plan.out'
                        timeout(time: 1, unit: 'MINUTES'){
                        input "Please approve to proceed Apply"
                        }
                            sh 'terraform apply "plan.out"'
                            
                }
            }
                    
                    switch (params.ACTION) {
                        case 'Destroy':
                    stage('Terraform Destroy') {
            steps {
                script {
                            sh 'terraform plan'
                        timeout(time: 1, unit: 'MINUTES'){
                        input "Please approve to proceed Destroy"
                        }
                            sh 'terraform destroy --auto-approve'
                            
                }
            }
                    
                    }
             
    }
}
        }
    }
}
        }
            }
}                    
    }
}
                

    



                                                                                                   
