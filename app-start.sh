
set -e

python manage.py migrate

python manage.py create_superuser -l "admin" -e "admin" -p "admin"

python manage.py collectstatic --noinput
