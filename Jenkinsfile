pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                echo "📦 Checking out source code..."
                git branch: 'main', url: 'https://github.com/ManvithaPantham/my-app-repoo.git'
            }
        }

        stage('Deploy with Chef') {
            steps {
                echo "🍳 Running Chef deployment..."

                // Display the current working directory
                bat 'echo Current directory: %CD%'

                // Run Chef using relative cookbook path
                bat '''
cd C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\cd_chef_pipelinee
chef-client --local-mode --chef-license accept ^
  --config-option cookbooks_path=C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\cd_chef_pipelinee\\cookbooks ^
  --runlist "recipe[my_app_deploy]"
'''

            }
        }
    }

    post {
        success {
            echo "✅ Deployment successful!"
        }
        failure {
            echo "❌ Deployment failed! Check Chef logs for details."
        }
    }
}
