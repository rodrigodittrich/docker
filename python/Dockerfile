FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y libzbar0 libjpeg-dev zlib1g-dev && \
    apt-get clean

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "file-to-base64.py"]