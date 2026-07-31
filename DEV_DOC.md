# DEV_DOC

## Overview

This document explains how to set up, build, and manage the Inception project from scratch.

---

# Prerequisites

Before starting, install the following tools:

- Docker
- Docker Compose
- Make
- Git

Verify the installation:

```bash
docker --version
docker compose version
make --version
git --version
```

---

# Project Structure

```text
.
├── Makefile
├── .env
├── srcs/
│   ├── docker-compose.yml
│   └── requirements/
│       ├── mariadb/
│       ├── nginx/
│       └── wordpress/
├── README.md
├── USER_DOC.md
└── DEV_DOC.md
```

---

# Configuration

The project uses a `.env` file to configure the services.

Example:

```env
DOMAIN_NAME=login.42.fr

MYSQL_DATABASE=wordpress
MYSQL_USER=wpuser
MYSQL_PASSWORD=password
MYSQL_ROOT_PASSWORD=rootpassword

WP_ADMIN_USER=owner
WP_ADMIN_PASSWORD=password
WP_ADMIN_EMAIL=admin@example.com

WP_USER=user
WP_USER_PASSWORD=password
WP_USER_EMAIL=user@example.com
```

> **Note:** The administrator username should not contain `admin`, as required by the project subject.

---

# Persistent Data

Before launching the project, create the directories used by the bind mounts:

```bash
mkdir -p /home/nel-khad/data/wordpress
mkdir -p /home/nel-khad/data/mariadb
```

These directories store:

- WordPress files
- MariaDB database

Their contents remain even if the containers are recreated.

---

# Build the Project

Build all Docker images:

```bash
make
```

or

```bash
docker compose -f srcs/docker-compose.yml up --build
```

---

# Start the Project

```bash
make
```

---

# Stop the Project

```bash
make down
```

or

```bash
docker compose down
```

---

# Useful Commands

### Running containers

```bash
docker compose ps
```

### Container logs

```bash
docker compose logs
```

### Enter a container

```bash
docker exec -it nginx sh
docker exec -it wordpress sh
docker exec -it mariadb sh
```

### Restart containers

```bash
docker compose restart
```

---

# Volumes

Display all volumes:

```bash
docker volume ls
```

Inspect a volume:

```bash
docker volume inspect wordpress
docker volume inspect mariadb
```

---

# Networks

Display Docker networks:

```bash
docker network ls
```

Inspect the project network:

```bash
docker network inspect inception
```

---

# Data Persistence

This project uses **bind mounts**.

Host:

```text
/home/nel-khad/data/
```

Container:

```text
WordPress → /var/www/html

MariaDB → /var/lib/mysql
```

Because the data is stored on the host machine, it is preserved even after removing and recreating the containers.

---

# Cleaning the Project

Stop the containers:

```bash
make down
```

Remove containers, networks, images, and volumes:

```bash
make fclean
```

or

```bash
docker compose down -v
```