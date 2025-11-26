# Используем легковесный образ nginx
FROM nginx:alpine

# Копируем наш HTML файл в директорию nginx
COPY index.html /usr/share/nginx/html/index.html

# Копируем конфигурацию nginx (опционально)
# COPY nginx.conf /etc/nginx/nginx.conf

# Открываем порт 80
EXPOSE 80

# Запускаем nginx
CMD ["nginx", "-g", "daemon off;"]
