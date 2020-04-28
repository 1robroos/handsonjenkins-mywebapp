#!/usr/bin/groovy
// Declarative pipeline; Each stage directive needs a steps directive.
pipeline {
  agent any

        environment {
                //PYTHONPATH = "${WORKSPACE}/section_4/code/cd_pipeline"
                ex5Quest1Repo = "handsonjenkins_ex5"  
        }

  stages {
    stage('Build') {
        steps { buildApp() }
    }
    

    stage('Deploy') {
        steps { deployApp() }
    }

    // stage('Ping') {
    //   steps {
    //     echo 'Ping'
    //   }
    // }

  } //stage definitions
}  // pipeline

    def buildApp() {
        sh "echo Building..."
        dir ('.' ) {
            def appImage = docker.build("${ex5Quest1Repo}:${BUILD_NUMBER}")
        }
    }

    def deployApp() {
        sh "echo Deploying..."
            def containerName = 'ex5Quest1'
            def port = '8181'
            sh "docker ps -f name=${containerName} -q | xargs --no-run-if-empty docker stop"
            sh "docker ps -a -f name=${containerName} -q | xargs -r docker rm"
            sh "docker run -d -p ${port}:80 --name=${containerName} ${ex5Quest1Repo}:${BUILD_NUMBER}  "
    }
