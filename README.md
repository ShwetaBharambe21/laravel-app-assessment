# Laravel DevOps Assessment

## Project Overview

This project demonstrates the implementation of modern DevOps practices for deploying and managing a Laravel application on AWS.

The goal of the project is to showcase end-to-end DevOps automation, including:

* Containerization using Docker
* Infrastructure provisioning using Terraform
* Continuous Integration and Continuous Deployment (CI/CD) using GitHub Actions
* Automated deployment to AWS EC2
* Application monitoring and troubleshooting
* Infrastructure as Code (IaC) principles

This repository represents a real-world deployment workflow where application code changes are automatically deployed to a cloud environment through a CI/CD pipeline.

---

# Solution Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions Pipeline
    │
    ▼
AWS EC2 Instance
    │
    ▼
Docker Container
    │
    ▼
Laravel Application
```

---

# Technologies Used

## Application Layer

* Laravel
* PHP 8.x
* Composer

## Containerization

* Docker

## CI/CD

* GitHub Actions

## Cloud Platform

* AWS EC2

## Infrastructure as Code

* Terraform

## Operating System

* Ubuntu Linux

## Version Control

* Git
* GitHub

---

# Project Structure

```text
.
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── app/
├── bootstrap/
├── config/
├── database/
├── deployment/
│   ├── deploy.sh
│   └── rollback.sh
│
├── docker/
├── public/
├── resources/
├── routes/
├── storage/
├── terraform/
├── tests/
│
├── artisan
├── composer.json
├── docker-compose.yml
├── Dockerfile
└── .env.example
```

---

# Features Implemented

### Dockerized Laravel Application

The Laravel application is packaged inside a Docker container, ensuring consistency across development and production environments.

### Automated CI/CD Pipeline

Every push to the main branch automatically triggers a deployment workflow.

Pipeline stages:

1. Checkout source code
2. Connect to EC2 server
3. Pull latest code
4. Execute deployment script
5. Restart application
6. Verify deployment

### AWS Deployment

Application is deployed on an AWS EC2 instance and exposed through a public endpoint.

### Infrastructure as Code

Terraform scripts are included for automated infrastructure provisioning and management.

### Deployment Automation

Custom shell scripts automate:

* Deployment
* Rollback
* Application restart

---

# Prerequisites

Install the following tools before running the project.

## Required Software

### Git

Verify installation:

```bash
git --version
```

### Docker

Verify installation:

```bash
docker --version
```

### Docker Compose (Optional)

Verify installation:

```bash
docker-compose --version
```

### PHP 8.x

Verify installation:

```bash
php -v
```

### Composer

Verify installation:

```bash
composer --version
```

### Terraform

Verify installation:

```bash
terraform version
```

---

# Running the Project Locally

## Step 1: Clone Repository

```bash
git clone https://github.com/ShwetaBharambe21/laravel-app-assessment.git

cd laravel-app-assessment
```

---

## Step 2: Create Environment File

```bash
cp .env.example .env
```

---

## Step 3: Install Dependencies

```bash
composer install
```

---

## Step 4: Generate Application Key

```bash
php artisan key:generate
```

---

## Step 5: Create SQLite Database

```bash
mkdir -p database

touch database/database.sqlite
```

---

## Step 6: Run Database Migrations

```bash
php artisan migrate
```

---

## Step 7: Start Laravel Application

```bash
php artisan serve
```

Application will be available at:

```text
http://127.0.0.1:8000
```

---

# Running with Docker

## Build Docker Image

```bash
docker build -t laravel-app .
```

## Run Container

```bash
docker run -d \
-p 9000:9000 \
--name laravel-app \
laravel-app
```

## Verify Running Container

```bash
docker ps
```

## Access Application

```text
http://localhost:9000
```

---

# Infrastructure Provisioning

Terraform configuration files are available in:

```text
terraform/
```

Initialize Terraform:

```bash
terraform init
```

Review execution plan:

```bash
terraform plan
```

Provision resources:

```bash
terraform apply
```

---

# CI/CD Pipeline

GitHub Actions workflow file:

```text
.github/workflows/deploy.yml
```

Whenever code is pushed to the main branch:

```bash
git add .
git commit -m "Feature update"
git push origin main
```

The deployment pipeline automatically:

* Pulls latest code
* Connects to AWS EC2
* Deploys application
* Restarts services
* Verifies deployment

---

# Deployment Verification

SSH into EC2:

```bash
ssh -i laravel-key.pem ubuntu@<EC2-PUBLIC-IP>
```

Verify container:

```bash
docker ps
```

Check logs:

```bash
docker logs laravel-app
```

Verify application:

```bash
curl http://localhost:9000
```

---

# Challenges Faced and Solutions

## Docker Compose Not Available

### Problem

Deployment failed because Docker Compose was unavailable on the target EC2 instance.

### Solution

Deployment workflow was updated to use native Docker commands.

---

## Missing Laravel APP_KEY

### Problem

Application returned HTTP 500 errors.

### Solution

Generated application key:

```bash
php artisan key:generate
```

---

## Missing SQLite Database

### Problem

Laravel cache operations failed because the SQLite database file did not exist.

### Solution

Created database file manually:

```bash
touch database/database.sqlite
```

---

## CI/CD Deployment Failures

### Problem

GitHub Actions deployment initially failed due to environment and deployment script issues.

### Solution

Updated deployment scripts and workflow configuration until automated deployment completed successfully.

---

# Screenshots

## Application Running

Add screenshot here:

```text
screenshots/application-running.png
```

---

# Future Improvements

* Kubernetes deployment
* AWS EKS integration
* Monitoring using Prometheus and Grafana
* Nginx reverse proxy
* SSL/TLS configuration
* Blue-Green deployment strategy

---

# Author

## Shweta Bharambe

DevOps Engineer

GitHub:
https://github.com/ShwetaBharambe21

LinkedIn:
[(https://www.linkedin.com/in/shweta-bharambe/)]

```
```
