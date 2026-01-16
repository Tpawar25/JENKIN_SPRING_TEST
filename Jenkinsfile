pipeline {
    agent any

    tools {
        jdk 'Java 17'
        maven 'Maven-home'
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo 'Pulling from GitHub'
                git branch: 'main',  credentialsId: 'Git-cred',
                    url: 'https://github.com/Tpawar25/JENKIN_SPRING_TEST.git'
            }
        }

        stage('Build Spring Boot Project') {
            steps {
                echo 'Building Spring Boot project'
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image'
                bat 'docker build -t myjavaspringproj:1.0 .'
            }
        }

        stage('Run Spring Boot Application') {
            steps {
                echo 'Running Spring Boot application'
                bat '''
                docker rm -f myjavaspringproj-container 2>nul || exit 0
                docker run --name myjavaspringproj-container myjavaspringproj:1.0
                '''
            }
        }
    }

    post {
        success {
            echo 'Build and Run SUCCESSFUL!'
        }
        failure {
            echo 'Failure!'
        }
    }
}
