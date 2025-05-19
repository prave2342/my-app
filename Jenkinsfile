pipeline {
    agent any
    environment {
        ECR_REGISTRY = '307562441588.dkr.ecr.ap-south-1.amazonaws.com'
        ECR_REPOSITORY = 'dev-demo-ecr'
        IMAGE_TAG = "java-app-${env.BUILD_NUMBER}"
        FULL_IMAGE = "${ECR_REGISTRY}/${ECR_REPOSITORY}:${IMAGE_TAG}"
    }
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out source...'
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Building Java app with Maven...'
                sh 'mvn clean package'
            }
        }
        stage('Docker Build') {
            steps {
                echo 'Building Docker image...'
                sh "docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG ."
            }
        }
        stage('Docker Push') {
            steps {
                echo 'Logging into ECR and pushing image...'
                sh """
                    aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $ECR_REGISTRY
                    docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
                """
            }
        }
        stage('Update Deployment YAML') {
            steps {
                echo 'Replacing image placeholder in deployment.yaml...'
                sh """
                    sed -i 's|ECR_IMAGE_PLACEHOLDER|$FULL_IMAGE|' deployment.yaml
                """
            }
        }
        stage('Deploy to EKS') {
            steps {
                echo 'Deploying app to EKS...'
                sh """
                    kubectl apply -f deployment.yaml -n myapp
                """
            }
        }
    }
}
