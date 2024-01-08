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

// node {
//     def app

//     stage('Clone repository') {
      

//         checkout scm
//     }

//     stage('Build image') {
  
//        app = docker.build("brandonjones085/test")
//     }

//     stage('Test image') {
  

//         app.inside {
//             sh 'echo "Tests passed"'
//         }
//     }

//     stage('Push image') {
        
//         docker.withRegistry('https://registry.hub.docker.com', 'git') {
//             app.push("${env.BUILD_NUMBER}")
//             app.push("latest")
//         }
//     }
// }

pipeline {
    agent any
    tools{
        jdk 'openjdk'
        maven 'maven-3'
    }

    stages {
        stage('SCM') {
            steps {
                git changelog: false, poll: false, url: 'https://github.com/jaiswaladi246/docker-spring-boot-java-web-service-example.git'
            }
        }
        stage('Maven-Build') {
            steps {
                sh "mvn clean install"
            }
        }
        stage('Docker Build & Push') {
            steps {
                script{
                    withDockerRegistry(credentialsId: 'dockerhub', toolName: 'docker') {
                        sh "docker build -t yahya4246/jenkins-image:tag123 ."
                        // sh "docker push yahya4246/jenkins-image:tag123"
                    }
                }
            }
        }
    }
}
