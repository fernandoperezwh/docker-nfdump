# UC-CEI2023 - "Nfdump" the netflow processing tool

This repository is part of the resources used during the "Congreso de Estudiantes de Ingeniería (CEI2023)".


You can find more information about the netflow processing tools in the [nfdump's repository](https://github.com/phaag/nfdump)


# Prerequisites

The installation of nfdump is done with Docker. Therefore, having docker installed is a must.

It is also necessary to have the netflow files inside the `flows` folder found in this same repository.


# Installation

## 1. Build the docker image

Build the Docker image with the following command.
```bash
docker build -t nfdump .
```

[Optional] You can check the image that was created by listing the docker images.
```bash
docker images
```

## 2. Run a docker container with the image named _"nfdump"_.

Use the next command to create and run a docker container in background with the "nfdump" image.

```bash
docker run -d --name nfdump \
    -v "$(pwd)/flows:/app/flows" \
    -it nfdump
```


[Optional] You can check that the container was created and its status is "running".
```bash
docker ps -a
```

[Optional] If the container is exited, you can start the container with the next command.
```bash
docker start nfdump
```

## 3. Access to the docker container and process the flows with "nfdump"

Once you have your container running, you can access to it with the next command.
```bash
docker exec -it nfdump /bin/bash
```

Run the command below to parse the netflow's files and export in a json file.
```bash
nfdump -R <directory_path> -o json > /app/output.json

# Example
# nfdump -R /app/flows/2023/ -o json > /app/output.json
```

