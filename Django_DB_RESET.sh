#!/bin/bash
echo "Resetting Django project data..."

# 1. Remove SQLite DB
rm -f db.sqlite3

# 2. Remove migration files
find . -path "*/migrations/*.py" -not -name "__init__.py" -delete
find . -path "*/migrations/*.pyc" -delete

# 3. Remove media files
rm -rf media/*

# 4. Remove collected static
rm -rf staticfiles/*

# 5. Rebuild
python manage.py makemigrations
python manage.py migrate
echo "Done! Fresh database ready."
