# Inception

## Project Overview

Inception is a project from 42 School where the goal is to build a small web infrastructure using Docker.

The project consists of creating multiple services running in isolated containers and making them communicate together to host a WordPress website.

The infrastructure is composed of:

- NGINX
- WordPress + PHP-FPM
- MariaDB


## Project Goal

This project introduces the basics of system administration, virtualization, and containerization.

It helps us understand:

- How web servers work
- How services communicate together
- How to manage containers
- How to configure and deploy a web infrastructure
- How to use Docker in a professional environment


## Real World Usage

The technologies used in this project are widely used in companies:

- Docker → application deployment and cloud environments
- NGINX → web servers, reverse proxy, load balancing
- MariaDB → database management
- WordPress → content management systems


# Architecture


![Architecture](assets/architecture.png)


## Services


### NGINX

NGINX is the entry point of the infrastructure.

It:
- Handles HTTPS requests
- Provides SSL/TLS security
- Redirects requests to WordPress


### WordPress

WordPress is the application layer.

It:
- Runs the website
- Uses PHP-FPM to execute PHP code
- Communicates with MariaDB


### MariaDB

MariaDB is the database service.

It stores:
- Users
- Posts
- Website configuration
- WordPress data


# Project Flow


```
User
 |
 | HTTPS :443
 v
NGINX
 |
 | FastCGI
 v
WordPress + PHP-FPM
 |
 | MySQL
 v
MariaDB
```


# Docker Overview


## What is Docker?

Docker is a platform that allows applications to run inside isolated environments called containers.


## Main Components


### Docker Image

A template used to create containers.

Example:

```
Image → Container
```


### Docker Container

A running instance of an image containing the application and its dependencies.


### Dockerfile

A file containing instructions to build a Docker image.


### Docker Compose

A tool used to define and manage multiple containers using a YAML configuration file.


# Containers vs Virtual Machines


![Docker vs VM](assets/docker_vs_vm.png)


Containers are lighter than virtual machines because they share the host operating system kernel.


# Volumes and Networks


## Volumes

Volumes allow data persistence.

Example:

```
MariaDB Container
        |
        v
 Docker Volume
```

Database data remains even if the container is deleted.


## Network

Docker network allows containers to communicate securely.

Example:

```
NGINX → WordPress → MariaDB
```


# Installation


Requirements:

- Docker
- Docker Compose
- Make


Start the project:

```bash
make
```


Access the website:

```
https://your_domain
```


# Documentation

More details:

- USER_DOC.md
- DEV_DOC.md


# Author

Noussaiba Elkhadar