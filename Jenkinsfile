pipeline {
  agent any
  tools {
    jdk 'Java17'
    maven 'Maven'
  }
  stages {
    stage('Checkout Code') {
      steps {
        echo 'Pulling from Github'
        git branch: 'main', credentialsId: 'Git-cred', url: 'https://github.com/Tpawar25/JENKIN_SPRING_TEST.git'
      }
    }
//     stage('Test Code') {
//       steps {
//         echo 'JUNIT Test case execution started'
//         bat 'mvn clean test'
//
//       }
//       post {
//         always {
// 		  junit '**/target/surefire-reports/*.xml'
//           echo 'Test Run is SUCCESSFUL!'
//         }
//
//       }
    }
    stage('Build Project') {
      steps {
        echo 'Building Sring-Boot project'
        bat 'mvn clean package -DskipTests'
      }
    }
    stage('Build the Docker Image') {
      steps {
        echo 'Building Docker Image'
        bat 'docker build -t myjavaspringproj:1.0 .'
      }
    }

    stage('Run Docker Container') {
      steps {
        echo 'Running Java Application'
        bat '''
        docker rm -f myjavaspringproj-container || exit 0
        docker run --name myjavaspringproj-container myjavaspringproj:1.0

        '''
      }
    }
  }
  post {
    success {
      echo 'BUild and Run is SUCCESSFUL!'
    }
    failure {
      echo 'OOPS!!! Failure.'
    }
  }
}