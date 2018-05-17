pipeline {
  agent none
  stages {
    stage('build') {
      agent {
        docker { image 'gcr.io/kaniko-project/executor' }
      }
      steps {
        sh 'cp /kaniko/executor ./'
        sh 'ls'
        stash includes: 'executor', name: 'kaniko-executor'
      }
    }
  }
}
