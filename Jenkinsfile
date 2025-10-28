pipeline {
    agent any

    environment {
        CHEF_REPO = "E:/my-app-repo"
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
            cd E:/my-app-repo
            chef-client --local-mode --chef-license accept ^
                --config-option cookbooks_path=E:/my-app-repo/cookbooks ^
                --runlist 'recipe[my_app_deploy]'
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

