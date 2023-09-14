Construir la imagen de docker
```bash
docker build -t nfdump .
```

Ver las imagenes de docker que tenemos
```bash
docker images
```


Correr el contenedor en segundo plano
```bash
docker run -d --name nfdump \
    -v "$(pwd)/flows:/app/flows" \
    -it nfdump
```

Ver que el contenedor esta corriendo
```bash
docker ps -a
```


Entrar al contenedor de docker
```bash
docker exec -it nfdump /bin/bash
```