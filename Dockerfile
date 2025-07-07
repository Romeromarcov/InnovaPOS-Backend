# 🐍 Imagen base
FROM python:3.11-slim-buster

# Instala netcat (nc) y el cliente de PostgreSQL (psql)
RUN apt-get update && apt-get install -y netcat-traditional postgresql-client && rm -rf /var/lib/apt/lists/*

# ⚙️ Variables de entorno
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# 📁 Carpeta de trabajo en el contenedor
WORKDIR /app

# 🧱 Copiar requirements primero (mejor uso de caché)
COPY requirements.txt /app/
RUN apt-get update && apt-get install -y dos2unix && \
    pip install --no-cache-dir -r requirements.txt

# 📜 Copiar entrypoint antes de manipularlo
COPY entrypoint.sh /app/

# 🧼 Asegurar formato y permisos del script
RUN dos2unix /app/entrypoint.sh && \
    chmod +x /app/entrypoint.sh

# 📦 Copiar el resto del código
COPY . /app/

# 🚀 Punto de entrada y comando por defecto
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
