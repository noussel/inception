# USER_DOC

# Starting the Project

## Build and start all services

```bash
make
```

or

```bash
docker compose up --build
```

This command:

- Builds the Docker images.
- Creates the containers.
- Starts all services.

---

# Stopping the Project

Stop the running containers:

```bash
make down
```

or

```bash
docker compose down
```

To remove containers, networks, and volumes:

```bash
make fclean
```

---

# Accessing the Website

Open your browser and visit:

```
https://nel-khad.42.fr
```

---

# Accessing the WordPress Admin Panel

Open:

```
https://nel-khad.42.fr/wp-admin
```

Log in using the administrator credentials defined in the `.env` file.

---

## Verify the Website

Open:

```
https://nel-khad.42.fr
```

If the WordPress homepage is displayed, the infrastructure is running correctly.

---

# Useful Commands & Verification

## Check Running Containers

List all running containers:

```bash
docker compose ps
```

or

```bash
docker ps
```

---
## View Logs

To inspect service logs:

```bash
docker compose logs
```

Or for a specific service:

```bash
docker compose logs nginx
docker compose logs wordpress
docker compose logs mariadb
```

---

## Enter a Container

Open a shell inside a running container.

NGINX

```bash
docker exec -it nginx sh
```

WordPress

```bash
docker exec -it wordpress sh
```

MariaDB

```bash
docker exec -it mariadb sh
```

---

## Check the Main Process (PID 1)

Every container should run a single main process as **PID 1**.

Inside the container:

```bash
ps -ef
```

or

```bash
ps aux
```

Expected main processes:

| Container | PID 1 |
|-----------|--------|
| NGINX | nginx |
| WordPress | php-fpm |
| MariaDB | mariadbd (or mysqld) |

You can also check directly from the host:

```bash
docker inspect --format '{{.State.Pid}}' nginx
```

---

## Check Docker Networks

List Docker networks:

```bash
docker network ls
```

Inspect the project network:

```bash
docker network inspect inception
```

(or `<project_name>_network` depending on your compose file)

You should see the three containers connected to the same network.

---

## Check Volumes

List all volumes:

```bash
docker volume ls
```

Inspect a volume:

```bash
docker volume inspect wordpress
```

or

```bash
docker volume inspect mariadb
```

Verify that the mount point corresponds to:

```
/home/nel-khad/data/
```

---

## Verify Bind Mounts

Display mounted volumes for a container:

```bash
docker inspect wordpress
```

or

```bash
docker inspect mariadb
```

Look for the **Mounts** section.

---

## View Container Logs

Display logs:

```bash
docker compose logs
```

Specific service:

```bash
docker compose logs nginx
docker compose logs wordpress
docker compose logs mariadb
```

---

## Verify HTTPS

HTTPS should work:

```
https://nel-khad.42.fr
```

HTTP should NOT work:

```
http://nel-khad.42.fr
```

The browser should display a self-signed certificate warning.

---

## Verify WordPress

Administrator panel:

```
https://nel-khad.42.fr/wp-admin
```

Verify that:

- the installation page does not appear;
- you can log in;
- you can edit a page;
- the changes are visible on the website;
- a regular user can add comments.

---

## Verify MariaDB

Enter the MariaDB container:

```bash
docker exec -it mariadb sh
```

Login:

```bash
mariadb -u root -p
```

Display databases:

```sql
SHOW DATABASES;
```

Select the WordPress database:

```sql
USE wordpress;
```

Display tables:

```sql
SHOW TABLES;
```

The database should not be empty.

---

## Restart Test (Persistence)

Stop everything:

```bash
docker compose down
```

Reboot the virtual machine.

Start again:

```bash
make
```

Verify that:

- the website is still accessible;
- WordPress remains configured;
- the database still contains data;
- previous website changes are preserved.

---

## Clean the Project

Stop containers:

```bash
make down
```

Remove containers, images, networks and volumes:

```bash
make fclean
```

or

```bash
docker compose down -v
```