@Library('shared-library-jenkins') _


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
    }
}