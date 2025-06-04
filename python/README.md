# Construa a imagem Docker
docker build -t file-base64 .

# Rode o container
docker run --rm -v "$PWD":/app file-base64