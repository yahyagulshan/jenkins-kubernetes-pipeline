

// pipeline {
//     agent any
//     tools{
//         jdk 'openjdk'
//         maven 'maven-3'
//     }

//     stages {
//         stage('SCM') {
//             steps {
//                 git changelog: false, poll: false, url: 'https://github.com/yahyagulshan/jenkins-kubernetes-pipeline'
//             }
//         }
//         stage('Maven-Build') {
//             steps {
//                 sh "mvn clean install"
//             }
//         }
//         stage('Deploy to k8s'){
//             steps{
//                 script{
//                     kubernetesDeploy (configs: 'deploymentservice.yaml',kubeconfigId: 'k8sconfigpwd')
//                 }
//             }
//         }  
//         // stage('Docker Build & Push') {
//         //     steps {
//         //         script{
//         //             withDockerRegistry(credentialsId: 'dockerhub', toolName: 'docker') {
//         //                 sh "docker build -t yahya4246/jenkins-image:tag123 ."
//         //                 // sh "docker push yahya4246/jenkins-image:tag123"
//         //             }
//         //         }
//         //     }
//         // }
//     }
// }
pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("my-image-name:${env.BUILD_ID}")
                }
            }
        }

        stage('Push Image Locally') {
            steps {
                script {
                    sh "eval $(minikube docker-env)"  // Enable Minikube to access local Docker daemon
                    dockerImage.push()
                }
            }
        }

        stage('Deploy to Minikube') {
            steps {
                script {
                    sh "kubectl apply -f deployment.yaml"  // Replace with your deployment manifest
                }
            }
        }
    }
}
