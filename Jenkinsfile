pipeline {
    agent any
    environment {
        MASTER_NODE = 'ec2-3-17-152-60.us-east-2.compute.amazonaws.com'
        WORKER_NODE = 'ec2-3-19-228-68.us-east-2.compute.amazonaws.com'
        USERNAME = 'ubuntu'
    }

    stages {
        stage('Hello') {
            steps {
                echo 'HI' ${MASTER_NODE}
            }
        }
    }
}
