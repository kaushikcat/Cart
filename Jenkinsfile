@Library('shared-library-kaushik') _


pipeline {
    agent any
    environment {
        registry = "670855725719.dkr.ecr.ap-south-1.amazonaws.com/kaushik-ecr"
    }
    
    stages {
        stage('Git Checkout') {
            steps {
                script {
                    gitCheckout(
                        branch: "main",
                        url: "https://github.com/kaushikcat/Cart.git"
                    )
                }
            }
        }
        stage('Unit Test maven') {
            steps {
                script {
                    mvnTest()
                }
            }
        }
        stage('Integration Test maven') {
            
            steps {
                script {
                    mvnIntegrationTest()
                }
            }
        }
        stage('Static code analysis: Sonarqube'){
            steps{
               script{
                   
                   def SonarQubecredentialsId = 'sonar-token'
                   statiCodeAnalysis(SonarQubecredentialsId)
               }
            }
        }
        stage('Quality Gate Status Check : Sonarqube'){
            steps{
               script{
                   
                   def SonarQubecredentialsId = 'sonar-token'
                   QualityGateStatus(SonarQubecredentialsId)
               }
            }
        }
        stage('Building image') {
            steps {
               script {
                   dockerImage = docker.build("${registry}")
             }
          }
       }
        stage('Docker Image Scan: trivy') {
           steps {
              script {
            // Define the Docker image to be scanned
                  def imageName = "${registry}"
            
            // Execute Trivy scan on the Docker image
                  sh "trivy image ${imageName}"
            }
          }
       }
        stage('Pushing to ECR') {
           steps {
               dockerImagePush()
               }
            }
    }
}
