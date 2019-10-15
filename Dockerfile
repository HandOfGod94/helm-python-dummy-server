FROM python:3-alpine
COPY . /opt/app
WORKDIR /opt/app
RUN pip install -U pip && pip install --no-cache-dir -r requirements.txt
EXPOSE 7001
ENTRYPOINT ["python", "app.py", "--port", "7001"]
