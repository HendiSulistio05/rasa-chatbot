FROM rasa/rasa:3.6.19

COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt

CMD ["rasa", "run", "--enable-api", "--port", "8000"]
