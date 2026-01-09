#!/bin/bash

echo "=== Building DevOps Application ==="

# Create build directory
mkdir -p build/classes

# Compile main Java files
javac -d build/classes $(find src/main/java -name "*.java")

# Compile test Java files, include main classes in classpath
javac -d build/classes -cp build/classes $(find src/test/java -name "*.java")

echo "Compilation complete."

echo "=== Running Tests ==="
# Run tests with main and test classes in classpath
java -cp build/classes com.example.HelloDevOpsTest
echo "Tests completed."

echo "=== Creating JAR ==="
# Create JAR from compiled classes
jar cfe app.jar com.example.HelloDevOps -C build/classes .
echo "JAR created: app.jar"

echo "=== Running Application ==="
java -jar app.jar