Here's a `README.md` file that provides instructions for setting up and running the Java Spring Boot application using the provided Docker and Docker Compose configurations.

```markdown
# Spring Boot Application with Docker

This project demonstrates how to deploy a Java Spring Boot application using Docker and Docker Compose. It includes a Spring Boot application that connects to a MySQL database.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Directory Structure](#directory-structure)
- [Getting Started](#getting-started)
- [Building and Running the Application](#building-and-running-the-application)
- [Accessing the Application](#accessing-the-application)
- [Environment Variables](#environment-variables)
- [Stopping the Application](#stopping-the-application)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Directory Structure

Your project directory should have the following structure:

```
/your-project
├── Dockerfile
├── docker-compose.yml
├── pom.xml
└── src
    └── ... (your Spring Boot application source code)
```

## Getting Started

1. **Clone the repository** (if applicable):
   ```bash
   git clone https://your-repo-url.git
   cd your-project
   ```

2. **Add your Spring Boot application code**: Ensure that your Spring Boot application is located in the `src` directory, and the `pom.xml` file is properly configured with your dependencies.

## Building and Running the Application

In your terminal, navigate to the project directory and execute the following command:

```bash
docker-compose up --build
```

This command will:

- Build the Docker images based on the `Dockerfile`.
- Create and start the containers defined in the `docker-compose.yml` file.

## Accessing the Application

Once the application is running, you can access the Spring Boot application at:

```
http://localhost:8080
```

## Environment Variables

The following environment variables are set in the `docker-compose.yml` file for the Spring Boot application:

- `SPRING_DATASOURCE_URL`: URL for the MySQL database (default: `jdbc:mysql://db:3306/mydb`)
- `SPRING_DATASOURCE_USERNAME`: Database username (default: `root`)
- `SPRING_DATASOURCE_PASSWORD`: Database password (default: `secret`)

You can modify these values in the `docker-compose.yml` file as needed.

## Stopping the Application

To stop the running application, press `CTRL+C` in the terminal where the containers are running. To remove the containers, run:

```bash
docker-compose down
```

This command will stop and remove the containers, along with the networks created by Docker Compose.

## Contributing

If you'd like to contribute to this project, please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.
```

### Usage

1. Create a file named `README.md` in the root of your project directory.
2. Copy and paste the content above into the `README.md` file.
3. Customize any sections as needed, especially the repository URL and licensing information.

This README provides clear instructions for anyone looking to set up and run the Spring Boot application with Docker, ensuring they have all the necessary information at their fingertips. If you need any further adjustments or additions, just let me know!
