properties([parameters([choice(name: 'ACTION', choices: ['Plan', 'Apply', 'Destroy'], description: 'Select Terraform Action')])])
pipeline{
    
    agent any 
    environment {
       //  environment variables for Azure credentials
        ARM_SUBSCRIPTION_ID = credentials('SUBSCRIPTION_ID')
        ARM_TENANT_ID = credentials('TENANT_ID')
        ARM_CLIENT_ID = credentials('CLIENT_ID')
        ARM_CLIENT_SECRET = credentials('CLIENT_SECRET')
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
        stage('Terraform Validate') {
            steps {
                script {
                    sh 'terraform validate'
                    switch (params.ACTION) {
                        case 'Plan':
                        stage('Terraform plan') {
            
                            sh 'terraform plan'
                            
                        }
                        break
                        case 'Apply':
                    stage('Terraform Apply') {
        
                            sh 'terraform plan -out=plan.out'
                        timeout(time: 1, unit: 'MINUTES'){
                        input "Please approve to proceed Apply"
                        }
                            sh 'terraform apply "plan.out"'
                            
                }
                       break 
                    
                        case 'Destroy':
                    stage('Terraform Destroy') {
            
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
            
        
    



                

    



                                                                                                   
