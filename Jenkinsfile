
masternode = 'master'
 
pipeline {
    environment {
        registry = "rohit965/web-app"
        registryCredential = "dockerhub"
    }
    agent none
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /$HOME/.m2:/$HOME/.m2'
                }
            }
            steps {
                sh 'mvn package'
            }
        }
        stage('Building image') {
            agent {
                label masternode
            }
            steps {
                script {
                    docker.build registry + ":$BUILD_NUMBER"
                }
            }          
            
        }

    }
}