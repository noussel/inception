# Inception

<p align="center">
  <img src="assets/inception_logo.png" width="200">
</p>


# 1. Project Overview

## What is Inception?

Inception is a system administration and virtualization project where the goal is to create a complete web infrastructure using Docker.

Instead of installing every service directly on a machine, each service is isolated inside its own container and configured to communicate together.

The final infrastructure hosts a WordPress website using:

- NGINX as a web server
- WordPress as a content management system
- MariaDB as a database


The project simulates a small production environment similar to what is used in real companies.

---

# 2. Project Goals

The main objective of Inception is to understand how modern web infrastructures are built and managed.

Through this project, we learn:

- How servers work
- How different services communicate
- How to containerize applications using Docker
- How to manage isolated environments
- How to automate server configuration
- How to manage persistent data
- How to secure services using HTTPS


## Real World Usage

The technologies learned in this project are widely used in professional environments:

### Docker

Used by companies to:
- deploy applications faster
- create reproducible environments
- simplify development and deployment

Examples:
- Backend applications
- Microservices
- Cloud infrastructures


### NGINX

Used as:
- Web server
- Reverse proxy
- Load balancer


Examples:
- Websites with millions of users
- APIs
- Cloud platforms


### MariaDB / MySQL

Used to store application data:

Examples:
- User accounts
- Products
- Orders
- Website content


### WordPress

Used for:
- Blogs
- Company websites
- Content platforms


---

# 3. Project Architecture


The infrastructure contains three main services:


```
                    Internet
                       |
                       |
                    HTTPS :443
                       |
                       v

                +-------------+
                |    NGINX    |
                | Web Server  |
                +-------------+
                       |
                       |
                  FastCGI :9000
                       |
                       v

                +-------------+
                |  WORDPRESS  |
                | PHP-FPM     |
                +-------------+
                       |
                       |
                 MySQL protocol
                       |
                       v

                +-------------+
                |  MARIADB    |
                | Database    |
                +-------------+


        All containers communicate
        through a private Docker network
```


---

# 4. Services Description


## NGINX Container


### Role

NGINX is the entry point of the infrastructure.

It receives requests from users and forwards them to WordPress.


### Contains:

- NGINX server
- TLS certificates
- Configuration files


### Why NGINX?

Because in real production environments, a web server is used to:

- handle client requests
- manage HTTPS
- improve security
- redirect traffic


Flow:

```
User Browser

      |
      |
 HTTPS Request

      |
      v

    NGINX

      |
      |
      v

 WordPress
```


---

## WordPress Container


### Role

WordPress is the application layer.

It generates the website pages and communicates with MariaDB to store information.


### Contains:

- WordPress files
- PHP-FPM
- WordPress configuration


### Why PHP-FPM?

PHP-FPM executes PHP code separately from NGINX.

NGINX handles HTTP requests,
PHP-FPM executes the application.


Flow:

```
NGINX

   |
   |
PHP-FPM

   |
   |
WordPress
```


---

## MariaDB Container


### Role

MariaDB stores all website data.


### Contains:

- Database server
- WordPress database
- Users
- Posts
- Settings


Example:


```
WordPress

     |
     |
     v

 MariaDB


Tables:

wp_users
wp_posts
wp_options
...
```


---

# 5. Complete Project Flow


When the user opens:

```
https://domain.com
```


The process is:


```
1) Browser sends HTTPS request

              |
              v

2) NGINX receives the request

              |
              v

3) NGINX sends PHP requests
   to WordPress container

              |
              v

4) WordPress executes PHP code

              |
              v

5) WordPress requests data
   from MariaDB

              |
              v

6) MariaDB returns data

              |
              v

7) WordPress generates the page

              |
              v

8) NGINX sends response
   back to browser
```


---

# 6. Docker Introduction


## What is Docker?

Docker is a platform that allows developers to package applications with everything they need and run them in isolated environments called containers.


Instead of installing:

- NGINX
- PHP
- MariaDB

directly on the machine, Docker creates independent environments.


---

# 7. Docker Components


## Docker Image


An image is a template used to create containers.


Example:


```
        Docker Image

             |
             |
             v

        Container
```


Example:

```
nginx image

      creates

nginx container
```


---

## Docker Container


A container is a running instance of an image.


It contains:

- application
- dependencies
- configuration


Containers are isolated but can communicate through networks.


---

## Dockerfile


A Dockerfile is a file containing instructions to build an image.


Example:


```
Dockerfile

FROM debian

RUN install nginx

COPY config files

CMD start nginx
```


Docker reads this file and creates an image.


---

## Docker Compose


Docker Compose allows managing multiple containers together.


Instead of running:


```
docker run nginx

docker run wordpress

docker run mariadb
```


We define everything in:


```
docker-compose.yml
```


Example:


```
services:

 nginx:
   build: ./nginx

 wordpress:
   build: ./wordpress

 mariadb:
   build: ./mariadb
```


Then:

```
docker compose up
```


starts the complete infrastructure.


---

# 8. Docker Container vs Virtual Machine


## Virtual Machine


```
Hardware

 |
Host OS

 |
Hypervisor

 |
Guest OS

 |
Application
```


A VM contains a complete operating system.


## Docker Container


```
Hardware

 |
Host OS

 |
Docker Engine

 |
Containers

 |
Applications
```


Containers share the host kernel.


Advantages:

- lighter
- faster
- easier deployment


---

# 9. Docker Volumes


Containers are temporary.

If a container is deleted, its data disappears.


Volumes allow data persistence.


Example:


```
MariaDB Container

        |
        |
        v

Docker Volume

        |
        |
        v

Database files
```


Even if the container is removed:

```
docker rm mariadb
```

the database remains.


---

# 10. Docker Network


Containers need to communicate.


Docker creates a private network:


```

        inception_network


              |
     --------------------

     |                  |

  nginx             wordpress

                         |
                         |
                      mariadb


```


Containers communicate using service names:


Example:

```
wordpress -> mariadb
```


No need to know IP addresses.


---

# Installation


Requirements:

- Docker
- Docker Compose
- Make


Clone repository:


```bash
git clone <repository>
cd inception
```


Create environment file:


```bash
cp .env.example .env
```


Start project:


```bash
make
```


Access:


```
https://your_domain
```


---

# Documentation

More details:

- USER_DOC.md
- DEV_DOC.md


---

# Author

Noussaiba Elkhadar

42 Network - UM6P