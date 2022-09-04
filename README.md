# DevOps Tool Kit Container

Devops Tools in a container for easy, platform agnostic 

## Tags

  - `latest`: Latest stable version of Devops Tools on ubuntu:latest 

## How to Build

This image is built on Quay.io automatically any time the upstream OS container is rebuilt, and any time a commit is made or merged to the `main` branch. But if you need to build the image on your own locally, do the following:

  1. [Install Docker](https://docs.docker.com/engine/installation/).
  2. `cd` into this directory.
  3. Run `docker build -t devops-tools .`


## How to Use

  1. [Install Docker](https://docs.docker.com/engine/installation/).
  2. Pull this image from Docker Hub: `docker pull quay.io/synominit0/devops-tools:latest` (or use the image you built earlier, e.g. `devops-tools:latest`).
  3. Change to directory with playbooks or plans, etc.
  4. Run and mount the container from the image:  `docker run -it -v ${PWD}:/project:rw devops-tools`
  5. You can now change to the project directory and run the commands inside of the container.

## Notes

I use this container to have a quick way to run my terraform plans, ansible playbooks etc. on any platform that has docker installed. 

> **Important Note**: I use this image suited to my specifications and tasks;  The settings and configuration used may not be suitable for your production environments. Use on production servers/in the wild at your own risk!

## Author

Created in 2022 by [David Pham](https://github.com/synominit), DevOps Engineer
