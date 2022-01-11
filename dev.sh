#/bin/bash
#Script for setting up local development
docker rm -f documentation
docker build -t documentation .
docker run -d -p 8080:8080 --name documentation documentation