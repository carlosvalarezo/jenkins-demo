pipeline {
    agent none

    stages {

        stage('Hello') {
          agent { docker 'maven:3-alpine' }
          steps {
              sh 'echo HI $MASTER_NODE'
          }
        }
        stage('load env vars'){
          agent { docker 'maven:3-alpine' }
          steps {
              withCredentials([string(credentialsId: 'MASTER_NODE', variable: 'MASTER_NODE')]) {
              sh "echo $MASTER_NODE"
            }
          }
        }



    }
}
