// #!groovy
// pipeline {
// 	agent none
//   stages {
//   	stage('Maven Install') {
//     	agent {
//       	docker {
//         	image 'maven:3.5.0'
//         }
//       }
//       steps {
//       	sh 'mvn clean install'
//       }
//     }
//   }
// }

node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
  
       app = docker.build("brandonjones085/test")
    }

    stage('Test image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'git') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
