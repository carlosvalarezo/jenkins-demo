pipeline {
    agent any
    environment{
          withCredentials([string(credentialsId: 'MASTER_NODE', variable: 'MASTER_NODE')]) {
          sh "echo $MASTER_NODE"
          MASTER_NODE=$MASTER_NODE
        }
    }

    stages {
        stage('Hello') {
            steps {
                sh 'echo HI $MASTER_NODE'
            }
        }
    }
}
