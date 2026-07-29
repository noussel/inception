# Inception

## Description

Inception is a system administration project from 42 School.
The goal is to build a small infrastructure using Docker and Docker Compose.

The project creates a complete WordPress website running with:
- NGINX as a web server
- WordPress as a CMS
- MariaDB as a database

Each service runs inside its own Docker container and communicates through a Docker network.

---

## Architecture

The infrastructure contains three main containers:

### NGINX
- Acts as the entry point of the website.
- Handles HTTPS connections using TLS certificates.
- Redirects requests to the WordPress container.

### WordPress
- Runs the WordPress website using PHP-FPM.
- Communicates with MariaDB to store and retrieve data.

### MariaDB
- Database service used by WordPress.
- Stores users, posts, settings and website information.

---

## Technologies Used

- Docker
- Docker Compose
- NGINX
- WordPress
- MariaDB
- PHP-FPM
- Bash scripting
- Linux

---

## Features

- Dockerized infrastructure
- HTTPS enabled website
- Persistent data using Docker volumes
- Automatic service configuration with scripts
- Isolated containers connected through Docker network

---

## Installation

### Requirements

Make sure you have installed:

- Docker
- Docker Compose
- Make

---

### Clone the repository

```bash
git clone <repository_url>
cd inception