FROM ubuntu:latest

# binary versions
ENV TERRAFORM_VERSION 1.2.8
ENV TERRAGRUNT_VERSION 0.38.9


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
    # Terragrunt
    curl -LO https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64; \
    chmod +x terragrunt_linux_amd64; \
    mv terragrunt_linux_amd64 /usr/local/bin/terragrunt; \
    # AWS Cli
    curl -LO https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip; \
    unzip awscli-exe-linux-x86_64.zip; \
    ./aws/install; \
    # Ansible and collections
    pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install requests; \
    pip3 install ansible; \
    ansible-galaxy collection install -r /devops/ansible-collections.yml


