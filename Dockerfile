FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy ALL application files (IMPORTANT FIX)
COPY . .

# Create a non-root user (SECURITY REQUIREMENT)
RUN useradd -m appuser
USER appuser

# Expose service port
EXPOSE 5000

# Run the application
CMD ["python", "run.py"]
