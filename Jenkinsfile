 
pipeline {
    environment {
        masternode = 'master'
        registry = "rohit965/web-app"
        registryCredential = "dockerhub"
        dockerImage = ''
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
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }          
            
        }
        stage('Pushing Image to DockerHub') {
            agent {
                label masternode
            }
            steps {
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                    }
                }
            }

        }

    }
}