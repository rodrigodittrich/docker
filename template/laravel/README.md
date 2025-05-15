# Template Laravel e MySQL com Docker

Este template em o objetivo de criar um projeto novo subindo dois containers (web e db) com o volume do espaço de trabalho e outro volume com o banco de dados.

### Criando e inicializando
```
docker compose up -d --build
``````

Executando o comando `docker compose` a aplicação já estará disponível e o banco de dados acessível.

Com o projeto criado e inicializado, segue-se o processo padrão como:
* Revisar e configurar o arquivo .env
* Executar as migrations
* Executar os seeders