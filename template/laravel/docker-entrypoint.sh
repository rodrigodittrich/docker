#!/bin/bash
set -e

if [ ! -f /var/www/html/artisan ]; then
    echo "🔄 Projeto Laravel não detectado. Copiando do container para o host..."
    cp -R /laravel-base/. /var/www/html
    chown -R www-data:www-data /var/www/html
    echo "✅ Projeto Laravel copiado com sucesso!"
else
    echo "✅ Projeto Laravel já existe no host. Nada será copiado."
fi

exec "$@"