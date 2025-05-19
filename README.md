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
##  Maven Build (Summary)

- Use `pom.xml` to manage dependencies and build configuration.
- Run `mvn package` to compile the code and create a JAR file.
- The JAR is used in the Docker image for containerization.
- Ensures reproducible builds and standardized project structure.

## Containerization 

- Package the Java app and its dependencies using a **Dockerfile**.
- Build a **Docker image** from that file.
- Push the image to **Amazon ECR**.
- The image is then used for deployment on **Amazon EKS**.
  
## Docker Image Versioning

- Tag images using semantic versions build numbers (e.g., `myapp:build-123`).
- Push version-tagged images to the container registry (ECR) to enable easy rollbacks and traceability.
- Automate tagging in CI/CD pipelines based on build numbers.

## Kubernetes EKS Deployment & Ingress Endpoint

- Use a Kubernetes Deployment YAML to define your app deployment,service, replicas, service.
- Use an  IngressRoute ( Traefik) to route external HTTP(S) traffic to your Service.
- Configure IngresRoutes with appropriate rules and host/path to expose the app via a URL like `https://live.cddemo.com/myapp`.
- Ensure your ServiceAccount has RBAC permissions to deploy and manage resources in the cluster.
- Deploy to the EKS cluster

## Application Endpoint

Visit: [https://live.cddemo.com/myapp]
Once deployed, the application is accessible via the following Traefik Ingress route:https://live.cddemo.com/myapp
You should see:

> **Hello I Got built pushed to ECR and then thus deployed here in EKS – All Green!**

## CI/CD with Jenkins

- Jenkins monitors your source code repository (e.g., GitHub) for changes via webhooks.
- On code push, Jenkins triggers the pipeline defined in your `Jenkinsfile`.
- Pipeline stages typically include:
  - **Build:** Compile the code using Maven.
  - **Test:** Run unit/integration tests.
  - **Dockerize:** Build Docker image and tag with version.
  - **Push:** Push the Docker image to a container registry (e.g., AWS ECR).
  - **Deploy:** Apply Kubernetes manifests update the app in EKS.
- Jenkins runs inside Kubernetes with a ServiceAccount configured with proper RBAC.
- Automated pipeline ensures fast, reliable deployments on every code change.
