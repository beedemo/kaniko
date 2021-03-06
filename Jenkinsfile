pipeline {
  options {
    disableConcurrentBuilds()
  }
  agent none
  
  environment {
    DOCKER_HUB_USER = 'beedemo'
    DOCKER_CREDENTIAL_ID = 'docker-hub-beedemo'
  }
  stages {
    stage('build') {
      agent {
        label 'docker'
      }
      steps {
        sh 'docker run -d --name kaniko-executor gcr.io/kaniko-project/executor:latest tail -f /dev/null'
        sh 'docker cp kaniko-executor:/kaniko/executor ./executor'
        sh 'docker cp kaniko-executor:/usr/local/bin/docker-credential-gcr ./docker-credential-gcr'
        sh 'docker cp kaniko-executor:/usr/local/bin/docker-credential-ecr-login ./docker-credential-ecr-login'
        sh 'docker cp kaniko-executor:/kaniko/ssl/certs/ ./certs/'
        
        sh 'docker run -d --name kaniko-debug gcr.io/kaniko-project/executor:debug-v0.1.0 /busybod/sh'
        sh 'docker cp kaniko-debug:/busybox/ ./busybox/'
        
        dockerBuildPush("${DOCKER_HUB_USER}", "kaniko", "jenkins-k8s-9", ".", "${DOCKER_CREDENTIAL_ID}")
      }
      post {
        always {
          sh 'docker rm -f kaniko-executor'
          sh 'docker rm -f kaniko-debug'
        }
      }
    }
  }
}
