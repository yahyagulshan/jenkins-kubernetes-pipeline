pipeline {
    agent any
    
    
    stages{
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t yahya4246/jenkins-image .'
                }
            }
        }
//         stage('Push image to Hub'){
//             steps{
//                 script{
//                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
//                    sh 'docker login -u yahya4246 -p ${dockerhubpwd}'

// }
//                    sh 'docker push yahya4246/jenkins-image'
//                 }
//             }
//         }
        
        stage('Deploy to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deployment.yaml',kubeconfigId: 'k8sconfigpwd')
                }
            }
        }
        
    }
}