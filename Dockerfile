FROM python:3.9   # Stick to 3.9 for Django 3.2 compatibility
WORKDIR /data

# Install distutils for Python
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install --no-cache-dir django==3.2

# Copy project files
COPY . .

# Run migrations
RUN python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
