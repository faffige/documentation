FROM ubuntu:latest
RUN apt-get update && apt-get install python3 python3-pip -y
RUN pip3 install mkdocs-material
COPY / /docs
RUN mv /docs/mkdocs.yaml /mkdocs.yaml && mv /docs/readme.md /docs/index.md
RUN pwd
RUN ls -la
RUN mkdocs build --clean --config-file mkdocs.yaml
CMD mkdocs serve --config-file mkdocs.yaml --dev-addr 0.0.0.0:8080