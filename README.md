
## Project Overview - Capstone project for AWS Cloud DevOps Nanodegree program

As part of AWS Cloud DevOps Nanodegree program - Capstone project, I deployed static website (nginx webserver) using CI/CD pipeline, created docker container and Kubernetes cluster in the pipeline and performed rolling updates using kubernetes built-in rolling update feature.

## Summary of CI/CD pipeline
CI/CD pipeline was implemented in CircleCI using circleci/config.yml. (Please look at detailed steps in .circleci/config.yml file)
1. lint-html - lints basic index.html page using 'tidy' linter. 

Commands: 

	tidy -q -e index.html

2. lint-docker - lints Dockerfile using hadolint linter. This step uses Makefile command 'make lint' to ease the process of linting.

Commands: 

	make lint

3. build-push-docker-image - builds docker image 'capstone-project-demowebsite', tags it and pushes it to DockerHub as shikhas/capstone-project-demowebsite

Commands: 

	docker build -t capstone-project-demowebsite .

	docker push shikhas/capstone-project-demowebsite
	  
4. deploy-to-aws - installs pre-requisites for using eksctl, creates kubernetes cluster using eksctl, deploys docker image 'capstone-project-demowebsite' using deployment.yml file and runs rolling deployment for new version of docker image.
 
Commands: 

- installs kubectl 

		curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
	
- installs eksctl

		curl --silent --location https://github.com/weaveworks/eksctl/releases/download/0.47.0/eksctl_Linux_amd64.tar.gz | tar xz -C /tmp
	
- creates cluster

		eksctl create cluster --name capstone-demoweb-cluster2 --region us-east-2  --ssh-access --ssh-public-key udapeople --managed
	
- deploys image to cluster

		kubectl apply -f deployment.yml
	
- performs rolling deployment

		kubectl set image deployments/capstone-project-demowebsite capstone-project-demowebsite=shikhas/capstone-project-demowebsite:v2
	
- checks rolling deployment status

		kubectl rollout status deployment/capstone-project-demowebsite
	
	


	

	


	
