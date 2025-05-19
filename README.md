# Java Hello Web App – CI/CD on EKS with Jenkins

This is a simple Java web application that runs an embedded HTTP server on port `8080` and returns a custom HTML message. The project is built with Maven, containerized with Docker, and deployed to an Amazon EKS cluster using Jenkins.

## Project Structure

```text
.
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
```
## Application Endpoint

Visit: [https://live.cddemo.com/myapp]
Once deployed, the application is accessible via the following Traefik Ingress route:https://live.cddemo.com/myapp
You should see:

> **Hello I Got built pushed to ECR and then thus deployed here in EKS – All Green!**

## Build & Run Locally

### Prerequisites

- Java 8+
- Maven
- Docker

### Steps

```bash
# Build the project
mvn clean package
