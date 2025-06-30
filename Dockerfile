FROM python:3.10

# Install MLflow and optional S3 support
RUN pip install mlflow boto3

# Create a writable directory for artifacts
RUN mkdir -p /app/artifacts

# Expose default MLflow port
EXPOSE 5000

# Set up working directory
WORKDIR /app

# Start MLflow Tracking Server with writable artifact path
CMD mlflow server \
    --backend-store-uri sqlite:///mlflow.db \
    --default-artifact-root /app/artifacts \
    --host 0.0.0.0 \
    --port $PORT \
    --workers 1
