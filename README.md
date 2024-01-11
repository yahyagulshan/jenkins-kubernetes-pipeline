# Prerequisites 
Before you begin, make sure you have the following:

* 1- Installed Jenkins on the local system or any VM.
* 2- Installed Kubernetes minikube.
* 3- Installed Docker.
* 4- Make sure Jenkins has a connection with Kubernetes  [how to make connection](https://medium.com/@devayanthakur/minikube-configure-jenkins-kubernetes-plugin-25eb804d0dec)
* 5- Dockerhub repo

# Detail about files that are placed on the repository for Containerize.

* this repo we have `Dockerfile` and `index.php` file. these files are for creating php web page.
![Screenshot from 2024-01-11 21-15-00](https://github.com/yahyagulshan/jenkins-kubernetes-pipeline/assets/59036269/fb7ab2cc-ca83-40a7-8e4b-af814cfc8937)

* for creating webpage `git clone https://github.com/yahyagulshan/jenkins-kubernetes-pipeline`
* and run `docker build -t "image-name" .`
* `docker run -d -p 3000:3000 "image-name":tag`


 # Detail about Jenkinsfile

 * in this jenkinsfile first build the docker image
 * 2nd push that image to the docker hub repo
 * and 3rd this image deployed to Kubernetes minikube.

### change as per your requirement
* change in line# 16 `dockerhub-pwd` this is the Jenkins credentials we create for docker hub login
* change user name in line #17
* change in line#28 kubernates credentials `my_kubernetes` this name comes from when we establish connection when using ^^ upper articale

# Kubernetes manifest file  

* `deployment.yaml` this file create Pod and service in kubernets minikube.