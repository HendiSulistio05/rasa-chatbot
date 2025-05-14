FROM rasa/rasa:3.6.19-full

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

EXPOSE 5005

CMD ["rasa", "train"]
CMD ["rasa", "run", "-i", "0.0.0.0", "-p", "5005"]

