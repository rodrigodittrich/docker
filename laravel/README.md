# Criando um container docker utilizando o laravel

Será feito um passo a passo e depois será finalizando para executar com docker compose

## Executar com Dockerfile

### Criar imagem
```
docker build -t rodrigodittrich/laravel:latest .
```

### Criar um container com a imagem laravel
```
docker run -d --name laravel -p 8000:8000 rodrigodittrich/laravel
```

### Verificar o log após executar o container
```
docker logs laravel
```
**Resultado**  
* Se o serviço do laravel foi iniciado com sucesso, o resultado será conforme abaixo:
```
    INFO  Server running on [http://0.0.0.0:8000].  

    Press Ctrl+C to stop the server
```

### Testar aplicação
```
http://localhost:8000/
```

### Acessar o container
```
docker exec -it laravel bash
```

### Copiar o projeto para fora do container
```
docker cp laravel:/var/www/app-laravel/. .
```