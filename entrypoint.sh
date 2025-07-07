#!/bin/sh
set -e

host="postgresql" # Asegúrate de que esto coincida con el nombre de tu servicio DB en docker-compose.yml
port="5432"
cmd="$@"

echo "Waiting for postgres at $host:$port..."
while ! nc -z $host $port; do
  sleep 0.1
done
echo "PostgreSQL started"

echo "Applying database migrations..."
# Django ahora gestionará todas las tablas
python manage.py migrate --noinput

echo "Collecting static files..."
python manage.py collectstatic --noinput

exec $cmd