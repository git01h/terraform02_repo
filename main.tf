# module "azure_TF" {
#     source = "./azure_TF"
  
# }
# pipeline {
#     agent any
#     environment {
#        // Define environment variables for Azure credentials
#         AZURE_SUBSCRIPTION_ID = "3d193e7b-bd4f-4cb1-becb-e31d4d51e3aa"
#         AZURE_TENANT_ID = "87fa2b03-576c-440b-93a5-b22dbb2e0c6d"
#         AZURE_CLIENT_ID = "24e73939-f71e-41ec-97d9-de9032b8df92"
#         AZURE_CLIENT_SECRET = "BGo8Q~bbMICd6C2XGFIyRkgwVrQUsEfkC3Uswdnh"
#     }
#     stages {
#         stage('Checkout') {
#             steps {
#                 echo 'Checking out code from Git'
#                 git(
#                     branch: 'main',
#                     url: 'https://github.com/git01h/terraform-repo.git',
#                     credentialsId: 'git_credentials'
#                 )
#             }
#         }

#         stage('Azure Login') {
#             steps {
#                 script {
#                     echo 'Logging in to Azure'
#                     // Login to Azure
#                     withCredentials([azureServicePrincipal(credentialsId: 'AppService_Principal', varAzureSubscriptionId:'3d193e7b-bd4f-4cb1-becb-e31d4d51e3aa' , varAzureTenantId:'87fa2b03-576c-440b-93a5-b22dbb2e0c6d', varAzureClientSecret:'BGo8Q~bbMICd6C2XGFIyRkgwVrQUsEfkC3Uswdnh', varAzureClientId:'24e73939-f71e-41ec-97d9-de9032b8df92' )]) {
                    
#                     }
#                 }
#             }
#         }

#         stage('Terraform Init') {
#             steps {
#                 script {
#                     sh 'terraform init'
#                 }
#             }
#         }

#         // Add similar echo statements for other stages
#     }
    

#     post {
#         always {
#             // Clean up or post-processing steps can be added here
#             script {
#                 echo 'Logging out from Azure'
#                 withCredentials([azureServicePrincipal(credentialsId: 'AppService_Principal', usePassword: true)]) {
#                     sh "az logout"
#                 }
#             }
#         }
#     }
# }