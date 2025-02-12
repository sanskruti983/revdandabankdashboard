# Use the official OpenJDK image
FROM openjdk:17

# Set the working directory
WORKDIR /app

# Copy the application JAR file to the container
COPY /*.jar /path/in/container/

# Expose the application port
EXPOSE 8080

# Run the Java application
CMD ["java", "-jar",  "build/libs/your-application.jar"]
