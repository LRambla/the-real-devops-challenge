FROM python:3.6.4

# Add source code and assign working directory
ADD . /app
WORKDIR /app

# Installing python libs and dependencies
COPY requirements.txt .
RUN pip3 install -r requirements.txt

# Expose our image on port 8080
EXPOSE 8080

# Set entrypoint
ENTRYPOINT [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=8080"]
