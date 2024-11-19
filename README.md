



1. Исходный код простого приложения
```java
package org.docker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Main {
    public static void main(String[] args) {
        SpringApplication.run(Main.class, args);
    }
}
```
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Docker</title>
</head>
<body>
<h1>Docker Example</h1>
</body>
</html>
```
```yaml
server:
  port: 80
  servlet:
    context-path: /
```
2. Содержимое Dockerfile с комментариями
```dockerfile
# Используем базовый образ с JDK 17
FROM openjdk:17-jdk-slim

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем .jar файл приложения в контейнер
COPY target/dockerExample-1.0.jar /app/dockerExample-1.0.jar

# Устанавливаем команду для запуска приложения
CMD ["java", "-jar", "/app/dockerExample-1.0.jar"]
```
docker-compose.yml
```yaml
version: '3.8'

services:
  example:
    build:
      dockerfile: Dockerfile # докер файл
    container_name: front # имя контейнера
    image: example # Образ докер
    restart: unless-stopped # перезагрузка по любым случаям, кроме остановки контейнера.
    ports:
      - "0.0.0.0:80:80" # 80 порт приложения, 80 внешний порт докера, на локальный адресс устройства запуска.
```
3. Сборка приложения:
```shell
mvn clean install
```
![Image alt](сборка%20приложения.jpg)
4. Команду сборки образа и запуск в фоне. -d
```shell
docker-compose -p example up --build -d
```
![Image alt](создание%20контейнера.jpg)
4. Команду запуска контейнера
```shell
docker start front
```
5. ID запущенного контейнера,
```shell
f578f198bd2a
```
6. Вывод списка всех запущенных контейнеров,
![Image alt](id%20контейнера.jpg)
7. Скриншот работающего приложения в браузере или в командной строке при запуске команды curl.
Удалил свои закладки.
![Image alt](работа%20приложения.jpg)


