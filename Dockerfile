# Use the official Python image as the base image
FROM python:3.9-slim

# Set environment variables for Azure Search and OpenAI integration
ENV AZURE_SEARCH_SERVICE=chatbot1212
ENV AZURE_SEARCH_INDEX=test2
ENV AZURE_SEARCH_KEY=W6SlPbsUk70mnBO2xGajlo5k9Q0hNHbOSWbALPXcu2AzSeCs9V7L
ENV AZURE_SEARCH_USE_SEMANTIC_SEARCH=True
ENV AZURE_SEARCH_SEMANTIC_SEARCH_CONFIG=default
ENV AZURE_SEARCH_TOP_K=5
ENV AZURE_SEARCH_ENABLE_IN_DOMAIN=False
ENV AZURE_SEARCH_CONTENT_COLUMNS=
ENV AZURE_SEARCH_FILENAME_COLUMN=
ENV AZURE_SEARCH_TITLE_COLUMN=
ENV AZURE_SEARCH_URL_COLUMN=

ENV AZURE_OPENAI_RESOURCE=testing1212
ENV AZURE_OPENAI_MODEL=testchatbot
ENV AZURE_OPENAI_KEY=c585003d54c449c09dcdafc18baa1d46
ENV AZURE_OPENAI_TEMPERATURE=0
ENV AZURE_OPENAI_TOP_P=1.0
ENV AZURE_OPENAI_MAX_TOKENS=1000
ENV AZURE_OPENAI_STOP_SEQUENCE=
ENV AZURE_OPENAI_SYSTEM_MESSAGE="You are an AI assistant that helps people find information."
ENV AZURE_OPENAI_PREVIEW_API_VERSION=2023-06-01-preview
ENV AZURE_OPENAI_STREAM=True
ENV AZURE_OPENAI_MODEL_NAME=gpt-35-turbo

# Install system dependencies
RUN apt-get update && apt-get install -y gcc

# Set the working directory inside the container
WORKDIR /app

# Copy the Python backend code into the container
COPY app.py .
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port on which your Python application listens
EXPOSE 5000

# Command to run your Python application
CMD ["python", "app.py"]