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
        sh 'docker cp kaniko-executor:/usr/local/bin/docker-credential-gcr ./docker-credential-gcr'
        sh 'docker cp kaniko-executor:/usr/local/bin/docker-credential-ecr-login ./docker-credential-ecr-login'
        sh 'docker cp kaniko-executor:/kaniko/ssl/certs/ ./certs/'
        sh 'docker rm -f kaniko-executor'
        sh 'ls -ls'
        dir('cert') {
          sh 'ls -la'
        }
        stash includes: 'executor', name: 'kaniko-executor'
      }
    }
  }
}
