FROM python:3.10

# Install MLflow and optional S3 support
RUN pip install mlflow boto3

# Expose default MLflow port
EXPOSE 5000

# Set up working directory
WORKDIR /mlflow

# Start MLflow Tracking Server
CMD mlflow server \
    --backend-store-uri sqlite:///mlflow.db \
    --default-artifact-root /mlflow/artifacts \
    --host 0.0.0.0 \
    --port 5000
