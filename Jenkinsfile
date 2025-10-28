pipeline {
    agent any

    environment {
        COOKBOOKS_PATH = "E:/my-app-repo/chef-cookbooks"
        RECIPE = "my_app_deploy"
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo "📦 Checking out source code..."
                 git branch: 'main', url:'https://github.com/ManvithaPantham/my-app-repoo.git'
            }
        }

        stage('Deploy with Chef') {
            steps {
                echo "🍳 Running Chef deployment..."
                bat """
                cd E:\\my-app-repo
                chef-client --local-mode --chef-license accept ^
                    --config-option cookbooks_path=%COOKBOOKS_PATH% ^
                    --runlist 'recipe[%RECIPE%]'
                """
            }
        }
    }

    post {
        success {
            echo '✅ Deployment completed successfully!'
        }
        failure {
            echo '❌ Deployment failed! Check Chef logs for details.'
        }
    }
}


