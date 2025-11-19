FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

ENV APP_NAME="My Docker Web App"
ENV APP_PORT=5000
CMD ["python", "app.py"]
