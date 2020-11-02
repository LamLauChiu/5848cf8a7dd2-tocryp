FROM python:3.7.9

EXPOSE 5000

ADD app.py .

ADD requirements.txt .

ADD templates/ ./templates

ADD app-config.properties .

RUN pip install -r requirements.txt

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
