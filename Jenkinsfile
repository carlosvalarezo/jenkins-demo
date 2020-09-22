node {
      stage('Hello') {

        steps {
            sh 'echo HI $MASTER_NODE'
        }
      }
      stage('load env vars'){
        steps {
            withCredentials([string(credentialsId: 'MASTER_NODE', variable: 'MASTER_NODE')]) {
            sh "echo $MASTER_NODE"
          }
        }
      }
}
