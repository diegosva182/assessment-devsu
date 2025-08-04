# Demo Devops NodeJs

This is a simple application to be used in the technical test of DevOps.

## Getting Started

### Prerequisites

- Node.js 18.15.0

### Installation

Clone this repo.

```bash
git clone https://bitbucket.org/devsu/demo-devops-nodejs.git
```

Install dependencies.

```bash
npm i
```

### Database

The database is generated as a file in the main path when the project is first run, and its name is `dev.sqlite`.

Consider giving access permissions to the file for proper functioning.

## Usage

To run tests you can use this command.

```bash
npm run test
```

To run locally the project you can use this command.

```bash
npm run start
```

Open http://localhost:8000/api/users with your browser to see the result.

### Features

These services can perform,

#### Create User

To create a user, the endpoint **/api/users** must be consumed with the following parameters:

```bash
  Method: POST
```

```json
{
    "dni": "dni",
    "name": "name"
}
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the response is unsuccessful, we will receive status 400 and the following message:

```json
{
    "error": "error"
}
```

#### Get Users

To get all users, the endpoint **/api/users** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
[
    {
        "id": 1,
        "dni": "dni",
        "name": "name"
    }
]
```

#### Get User

To get an user, the endpoint **/api/users/<id>** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the user id does not exist, we will receive status 404 and the following message:

```json
{
    "error": "User not found: <id>"
}
```

If the response is unsuccessful, we will receive status 400 and the following message:

```json
{
    "errors": [
        "error"
    ]
}
```

## License

Copyright © 2023 Devsu. All rights reserved.


🧪 Manual API Testing
You can test the API locally after running the container with using the local url http://localhost:8000 :

docker run -p 8000:8000 devsu-node-app
🔸 Create a User
curl -X POST http://localhost:8000/api/users \
  -H "Content-Type: application/json" \
  -d '{"dni": "1234567890", "name": "Diego Vaca"}'


# DevOps Technical Assessment – Node.js App

This project is part of the DevOps technical assessment. It includes:

- Dockerization of a Node.js app
- CI/CD pipeline using Azure DevOps
- Deployment to Kubernetes (Minikube)
- Manual API test examples
- Horizontal Pod Autoscaler (HPA)

---

## 🐳 Docker

### Build and run locally

```bash
docker build -t devsu-node-app .
docker run -p 8000:8000 devsu-node-app
⚙️ CI/CD with Azure DevOps

CI/CD pipeline (azure-pipelines.yml) includes:

Install & Test

Lint (if ESLint config exists)

Docker Build

Push to DockerHub (tuusuario/devsu-node-app:latest)

Pipeline runs on every push to master.


☸️ Kubernetes Deployment (Minikube)
Steps:

minikube start --driver=docker
kubectl config use-context minikube
kubectl apply -f k8s/
minikube service devsu-node-service

🎯 HPA Configuration

minReplicas: 2
maxReplicas: 5
targetCPUUtilizationPercentage: 70



Reporte de Coverage en azure pipelines


<img width="1608" height="823" alt="Image" src="https://github.com/user-attachments/assets/bef270c2-7f14-4451-ba1c-7ed54216b75a" />
