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

# Iniciar container com docker compose

### iniciar containers
```
docker compose up -d --build
```

Junto com o container do laravel, será iniciado um container com o serviço do MySql. Neste caso, pode ser acessado o container e executar as migrations.

### Executar migrations
```
php artisan migrate
```

Após executar as migrations, a banco de dados inicial terá a estrutura abaixo:
![](https://github.com/rodrigodittrich/docker/blob/main/laravel/mysql-laravel.png)

**Observação**  
Será necessário configurar as variáveis abaixo no arquivo ".env" para criar o banco de dados e também permitir o app conectar ao banco de dados.
```
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=<database-name>
DB_USERNAME=root
DB_PASSWORD=<password>
```