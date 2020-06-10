pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /$HOME/.m2:/$HOME/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') { 
            steps {
                sh 'mvn test' 
            }
        }
        stage('Building image') {
            agent none 
            steps {
                sh 'docker build -t web-app .'
                }          
            }
        }
    }
}