FROM ubuntu:latest
EXPOSE 8000

# Install system dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y git

# Set the working directory
WORKDIR /code

# Copy the requirements file and install dependencies
COPY requirements.txt /code/
RUN pip3 install -r requirements.txt

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

# Copy the FastAPI project files
COPY . /code/

# Start the FastAPI app
CMD ["./start.sh"]