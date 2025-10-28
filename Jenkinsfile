pipeline {
    agent any

    environment {
        CHEF_REPO = "C:/chef-cookbooks"
        RECIPE = "my_app_deploy"
    }

    stages {
        stage('Checkout Code') {
            steps {
                  git branch: 'main', url: 'https://github.com/ManvithaPantham/my-app-repoo.git'

            }
        }

        stage('Deploy with Chef') {
            steps {
                bat """
                cd %CHEF_REPO%
                chef-client --local-mode --runlist 'recipe[%RECIPE%]'
                """
            }
        }
    }

    post {
        success {
            echo 'Deployment completed successfully!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}

