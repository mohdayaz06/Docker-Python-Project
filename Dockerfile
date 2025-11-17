FROM python:3.6
MAINTAINER ayaz "mohammedayaz.r@gmail.com"
COPY . /app
WORKDIR /app
EXPOSE 80
RUN pip install -r requirements.txt
ENTRYPOINT ["python", "app.py"]
