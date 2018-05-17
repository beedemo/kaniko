pipeline {
  agent none
  stages {
    stage('build') {
      agent {
        label 'docker'
      }
      steps {
        sh 'docker run -d --name kaniko-executor gcr.io/kaniko-project/executor tail -f /dev/null'
        sh 'docker cp kaniko-executor:/kaniko/executor ./executor'
        sh 'docker rm -f kaniko-executor'
        sh 'ls'
        stash includes: 'executor', name: 'kaniko-executor'
      }
    }
  }
}
