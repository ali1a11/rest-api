# Arbeidskrav: Dockerisert Applikasjon
# Emne 8 Cloud-teknikker, web-arkitektur og container teknologi
# Docker Setup

## 🚀 Getting Started

### **1️⃣ Pull the Docker Images**
Run the following commands to pull the required images from Docker Hub:

```sh
docker pull alia012/rest-api-simpleapi:latest

docker pull alia012/rest-api-nginx:latest

docker pull alia012/mysql:8.0
```

### **2️⃣ Using Docker Compose**
To run the services using `docker-compose`, create a `docker-compose.yml` file and add the following configuration:

```yaml
version: '3.8'

services:
  nginx:
    image: alia012/rest-api-nginx:latest
    ports:
      - "80:80"
    networks:
      - app-network
    depends_on:
      - simpleapi

  simpleapi:
    image: alia012/rest-api-simpleapi:latest
    ports:
      - "8080:8080"
    environment:
      ASPNETCORE_ENVIRONMENT: "Production"
      ConnectionStrings__DefaultConnection: "Server=mysql_A;Port=3306;Database=SimpleApiDb;User=root;Password=my-secret-pw;"
    depends_on:
      - mysql_A
    networks:
      - app-network

  mysql_A:
    image: alia012/mysql:8.0
    container_name: mysql_A
    environment:
      MYSQL_ROOT_PASSWORD: my-secret-pw
      MYSQL_DATABASE: SimpleApiDb
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql
    networks:
      - app-network

networks:
  app-network:
    driver: bridge

volumes:
  mysql-data:
    driver: local
```

### **3️⃣ Run the Containers**
Once the `docker-compose.yml` file is ready, start the services with:

```sh
docker-compose up -d
```

This will pull the images (if not available locally) and start the containers in detached mode.

### **4️⃣ Verify Running Containers**
To check if the containers are running, use:

```sh
docker ps
```

To stop the containers, run:

```sh
docker-compose down
```

## 🔗 Docker Hub Repositories
- **REST API:** [alia012/rest-api-simpleapi](https://hub.docker.com/r/alia012/rest-api-simpleapi)
- **Nginx:** [alia012/rest-api-nginx](https://hub.docker.com/r/alia012/rest-api-nginx)
- **MySQL:** [alia012/mysql](https://hub.docker.com/r/alia012/mysql)

🔗 GitHub Repository

https://github.com/ali1a11/rest-api.git
---

If you encounter any issues, feel free to reach out! 🚀

