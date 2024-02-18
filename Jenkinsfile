@Library('shared-library-kaushik') _


pipeline {
    agent any
    
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
    }
}
