# Diplom Web App

Тестовое веб-приложение для дипломного проекта DevOps в Yandex.Cloud.

## Описание

Это простое веб-приложение, демонстрирующее полный цикл DevOps:
- Docker контейнеризация
- Kubernetes оркестрация
- CI/CD через GitHub Actions
- Мониторинг и логирование

## Стек технологий

- **Frontend:** HTML5, CSS3, JavaScript
- **Container:** Docker
- **Orchestration:** Kubernetes (k3s)
- **CI/CD:** GitHub Actions
- **Registry:** Docker Hub
- **Web Server:** Nginx Alpine

## Локальный запуск

```bash
# Сборка образа
docker build -t diplom-web-app:latest .

# Запуск контейнера
docker run -d -p 8080:80 --name diplom-web-app diplom-web-app:latest

# Проверка
curl http://localhost:8080
```

## Развертывание в Kubernetes

Приложение автоматически развертывается при создании Git tag (release).

### Ручное развертывание

```bash
# Применение манифестов
kubectl apply -f k8s/

# Проверка статуса
kubectl get pods
kubectl get services
kubectl get ingress
```

## Структура проекта

```
diplom-web-app/
├── index.html          # Главная страница приложения
├── Dockerfile          # Конфигурация Docker образа
├── .dockerignore       # Исключения для Docker
├── .gitignore         # Исключения для Git
├── README.md          # Документация
└── .github/
    └── workflows/
        └── build-and-deploy.yml  # GitHub Actions CI/CD
```

## CI/CD Pipeline

### Автоматическая сборка
- Запускается при push в main branch
- Запускается при создании Pull Request
- Собирает Docker образ и отправляет в Docker Hub

### Автоматическое развертывание
- Запускается при создании GitHub Release
- Обновляет образ в Kubernetes deployment
- Выполняет rollout с проверкой статуса

## Переменные среды

Для GitHub Actions требуются секреты:
- `DOCKER_USERNAME` - Docker Hub username
- `DOCKER_PASSWORD` - Docker Hub password
- `KUBE_CONFIG` - Kubernetes config (base64 encoded)

## Мониторинг

Приложение интегрировано с системой мониторинга:
- Prometheus для метрик
- Grafana для визуализации
- Traefik для ingress контроллера

## Автор

Мануилов Яков - Дипломный проект DevOps
