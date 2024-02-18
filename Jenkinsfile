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
    }
}
