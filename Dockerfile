FROM python:3.6.4

# Environment variables
ENV MONGO_URI=mongodb://127.0.0.1:27017/database

# Installing python libs and dependencies
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Add source code to our image
COPY . .

# Expose our image on port 8080
EXPOSE 8080

# Set entrypoint
ENTRYPOINT [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=8080"]
