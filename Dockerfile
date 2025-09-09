# Use an official Python runtime as a base image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Expose the port that the Flask app will run on
EXPOSE 5000

# Define the command to run the Flask application
# Set FLASK_APP environment variable (if your app file is not app.py or wsgi.py)
ENV FLASK_APP=app.py 
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "5000"]