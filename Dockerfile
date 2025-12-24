# Use lightweight Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies
RUN python -m pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Expose application port
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]
