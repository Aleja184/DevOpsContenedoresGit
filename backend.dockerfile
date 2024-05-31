#Backend
FROM maven:3.8.4-openjdk-17-slim AS backend-builder
WORKDIR /app/backend
COPY task/task/pom.xml .
RUN mvn dependency:go-offline
COPY task/task/src ./src
RUN mvn clean package -DskipTests
RUN echo "#!/bin/sh" > /app/backend/run.sh && \
    echo "set -e" >> /app/backend/run.sh && \
    echo "JAR_FILE=\$(find /app/backend/target -name '*.jar' | head -n 1)" >> /app/backend/run.sh && \
    echo "exec java -jar \$JAR_FILE" >> /app/backend/run.sh && \
    chmod +x /app/backend/run.sh

CMD ["/app/backend/run.sh"]


