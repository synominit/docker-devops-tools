FROM ubuntu:latest

ENV TERRAFORM_VERSION 1.2.8
# fix encoding for pypi packages
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ADD _devops /devops

# Install requirements
RUN apt update && apt install -y \
    git \
    curl \
    unzip \
    python3 \
    python3-pip \
    libkrb5-dev \
    gcc

# Install Terraform
RUN curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip; \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip; \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip; \
    chmod +x terraform; \
    mv terraform /usr/local/bin; \
    # Ansible and collections
    pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install requests; \
    pip3 install ansible; \
    ansible-galaxy collection install -r /devops/ansible-collections.yml