FROM python:3.8.6-alpine

ENV FLASK_ENV "production"
WORKDIR /app

COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com -r /tmp/requirements.txt

ADD . /app

EXPOSE 9010/tcp

CMD [ "gunicorn", "app:app", "-c", "gunicorn.conf" ]
