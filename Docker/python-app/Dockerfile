# Step 1: Specify the base image
FROM python:3.9-slim

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy the local files
COPY . /app

# Step 4: Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Expose the required port
EXPOSE 5000

# Step 6: Command to run the app
CMD ["python", "app.py"]
