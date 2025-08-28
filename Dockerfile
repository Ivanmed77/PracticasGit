# Usa Python oficial como base
FROM python:3.10-slim

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia los archivos de dependencias al contenedor
COPY requirements.txt .

# Instala las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código
COPY . .

# Crea grupo y usuario no root de forma compatible con Debian slim
RUN groupadd --system appgroup && useradd --system --gid appgroup --home-dir /app appuser

# Cambialos la propiedad al archivo
RUN chown -R appuser:appgroup /app

# Se Cambia al usuario appuser
USER appuser 

# Comando por defecto para ejecutar (ajusta esto si usas otro script)
EXPOSE 8000
CMD ["python", "main.py"]

