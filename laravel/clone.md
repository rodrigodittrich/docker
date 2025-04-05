Vamos considerar que o projeto foi criado conforme este arquivo DockerFile e que o código fonte foi enviado para o git e um outro desenvolvedor irá baixar o código fonte para subir o serviço.

Processos que outro dev deverá executar para depois somente seguir usando o docker compose.

### Clonar projeto
```
git clone https://github.com/rodrigodittrich/docker.git
```

### Criar a imagem
```
docker build -t <image-name> .
```

### Subir o container do laravel
```
docker run -d --name laravel -p 8000:8000 <image-name>
```

### Copiar a pasta vendor do container para o diretório do projeto
```
docker cp laravel:/var/www/app-laravel/vendor .
```

### Usar docker compose
A partir daqui, o container sempre pode ser iniciado utilizando o docker compose. Neste exemplo, é necessário executar os passos acima, pois é necessário copiar o diretório "vendor" (dependências do projeto) para que o serviço consiga iniciar com o docker compose.

```
docker compose up -d --build
```

O próximo exemplo tem o objetivo de ser automatizado (pensando em equipes de desenvolvimento) onde cada DEV irá clonar o projeto e iniciar-lo direto pelo "docker compose".