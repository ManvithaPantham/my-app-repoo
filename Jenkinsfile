pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo '📦 Checking out source code...'
                git branch: 'main', url: 'https://github.com/ManvithaPantham/my-app-repoo.git'
            }
        }

        stage('Deploy with Chef') {
            steps {
                echo '🍳 Running Chef deployment...'
                bat '''
                    echo Current directory: %CD%
                    chef-client --local-mode --chef-license accept ^
                      --config-option cookbooks_path=E:/my-app-repo/chef-cookbooks ^
                      --runlist "recipe[my_app_deploy]"
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Deployment failed! Check Chef logs for details.'
        }
    }
}
