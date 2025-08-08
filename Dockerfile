# Stick to 3.9 for Django 3.2 compatibility
FROM python:3.9

WORKDIR /data

# Install dependencies
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install --no-cache-dir django==3.2

# Copy project files
COPY . .

# Expose the Django port
EXPOSE 8000

# Run migrations and start server when container starts
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
