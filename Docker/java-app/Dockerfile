# Step 1: Specify the base image
FROM openjdk:17-jdk

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the local code to the container
COPY src/Main.java /app

# Step 4: Install the dependencies
RUN javac Main.java

# Step 5: Define the command to run the application
CMD ["java","Main"]

