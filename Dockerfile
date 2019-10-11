FROM python:3-alpine
COPY . /opt/app
WORKDIR /opt/app
EXPOSE 7001
ENTRYPOINT ["python", "app.py", "--port", "7001"]
