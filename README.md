# Java Hello Web App – CI/CD on EKS with Jenkins

This is a simple Java web application that runs an embedded HTTP server on port `8080` and returns a custom HTML message. The project is built with Maven, containerized with Docker, and deployed to an Amazon EKS cluster using Jenkins.

## 🧾 Project Structure

├── Dockerfile
├── Jenkinsfile
├── deployment.yaml
├── pom.xml
└── src
└── main
└── java
└── com
└── example
└── Hello.java
## Application Endpoint

Once deployed, the application is accessible via the following Traefik Ingress route:
https://live.cddemo.com/myapp
