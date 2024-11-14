FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
COPY vgg16_encoder.py .
COPY ingest_data.py .
COPY data/ ./data
RUN pip install --no-cache-dir -r requirements.txt
CMD ["sh", "-c", "python ingest_data.py && rm -rf data"]