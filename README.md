# AWS WordPress Deployment and Monitoring using CloudFormation

## Project Description

This project demonstrates how to deploy and monitor a WordPress application on Amazon Web Services (AWS) using AWS CloudFormation. The objective is to automate the provisioning of infrastructure and ensure a reliable and secure environment for hosting a blogging platform.

The project includes the setup of two WordPress environments:

1. A **Live Production Environment** used to publish blogs and documentation for businesses and technologies.
2. A **Development and Testing Environment** where developers can safely test updates and changes without impacting the live website.

The development environment is configured to run **only during business hours (9 AM – 6 PM)** to optimize infrastructure usage and reduce operational costs.

## Objectives

* Deploy a WordPress instance on AWS to establish a reliable online blogging platform.
* Use AWS CloudFormation to automate infrastructure provisioning.
* Create separate environments for **production** and **development/testing**.
* Implement monitoring to ensure system availability and performance.

## Real-World Scenario

Organizations that publish blogs and technical documentation often require a scalable and reliable platform. In this project, AWS infrastructure is used to deploy and manage WordPress, enabling businesses to host content while maintaining separate environments for development and testing.

## Technologies and Services Used

* **AWS Management Console** – Used to manage and configure AWS resources.
* **AWS CloudFormation** – Automates the creation and management of AWS infrastructure.
* **Amazon EC2** – Hosts the WordPress application.
* **WordPress** – Content management system used for publishing blogs.
* **Monitoring Tools** – Used to observe performance and ensure system reliability.

## Key Features

* Infrastructure provisioning using Infrastructure as Code (CloudFormation)
* Separate production and development environments
* Cost optimization by scheduling development resources
* Monitoring of application infrastructure
* Scalable cloud-based deployment
