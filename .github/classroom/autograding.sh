#!/bin/bash

# Puntos iniciales
PUNTOS=0

echo "--- Iniciando evaluación de la actividad ---"

# 1. Verificar si existe alguna carpeta (el nombre del estudiante)
# Buscamos cualquier directorio que no sea .git o .github
ESTUDIANTE_DIR=$(find . -maxdepth 1 -type d ! -name "." ! -name ".git" ! -name ".github" -print -quit)

if [ -n "$ESTUDIANTE_DIR" ]; then
    echo "✔ Carpeta detectada: $ESTUDIANTE_DIR"
    PUNTOS=$((PUNTOS + 25))
    
    # 2. Verificar los 3 archivos dentro de esa carpeta
    # Usamos -f y nombres exactos según tu enunciado
    
    # Archivo 1
    if [ -f "$ESTUDIANTE_DIR/Comandos_Ubuntu" ]; then
        echo "✔ Archivo 1 (Comandos_Ubuntu): Encontrado"
        PUNTOS=$((PUNTOS + 25))
    else
        echo "✘ Archivo 1 (Comandos_Ubuntu): No encontrado"
    fi

    # Archivo 2
    if [ -f "$ESTUDIANTE_DIR/Comandos_GIT" ]; then
        echo "✔ Archivo 2 (Comandos_GIT): Encontrado"
        PUNTOS=$((PUNTOS + 25))
    else
        echo "✘ Archivo 2 (Comandos_GIT): No encontrado"
    fi

    # Archivo 3
    if [ -f "$ESTUDIANTE_DIR/Prompting" ]; then
        echo "✔ Archivo 3 (Prompting): Encontrado"
        PUNTOS=$((PUNTOS + 25))
    else
        echo "✘ Archivo 3 (Prompting): No encontrado"
    fi

else
    echo "✘ Error: No has creado ninguna carpeta con tu nombre."
    exit 1
fi

echo "---"
echo "Puntuación calculada: $PUNTOS/100"

# Si no tiene los 100 puntos, salimos con error para que Classroom marque la X roja
if [ $PUNTOS -lt 100 ]; then
    exit 1
else
    exit 0
fi
