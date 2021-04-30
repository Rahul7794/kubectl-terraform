FROM python:3.7-slim

RUN apt-get update && apt-get install -y curl git-core curl build-essential openssl libssl-dev unzip wget

RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/0.13.0/terraform_0.13.0_linux_amd64.zip && \
    unzip terraform.zip  && \
    mv terraform /usr/local/bin/

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.0/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl &&  \
    mv ./kubectl /usr/local/bin/kubectl

WORKDIR /src

COPY . .
