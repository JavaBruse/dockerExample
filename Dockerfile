# Используем базовый образ с JDK 17
FROM openjdk:17-jdk-slim

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем .jar файл приложения в контейнер
COPY target/front-1.0.jar /app/front-1.0.jar

# Устанавливаем команду для запуска приложения
CMD ["java", "-jar", "/app/front-1.0.jar"]