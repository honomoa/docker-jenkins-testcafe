# DOCKER-JENKINS-TESTCAFE

TestCafe fit for jenkins pipeline

# How To Use

Jenkinsfile:

```
pipeline {
  agent {
    docker {
      image 'honomoa/docker-jenkins-testcafe'
    }
  }
  stages {
    stage('Clone scm') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']],
          userRemoteConfigs: [[url: 'http://git-server/user/repository.git']]])
      }
    }
    stage('Run TestCafe') {
      steps {
        sh 'testcafe "firefox,chromium --no-sandbox" tests/**/*.js -s screenshots --reporter spec,xunit:results/test-results.xml'
      }
      post {
        always {
          junit 'results/test-results.xml'
        }
      }
    }
  }
}
```
