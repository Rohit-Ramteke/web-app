pipeline {
    agent none

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'maven:3-alpine'
                    args '-v /$HOME/.m2:/$HOME/.m2'
                }
            }
        }
        stage('Building image') {
            steps {
                sh 'docker build -t web-app .'
            }          
            
        }
    }
}