FROM rasa/rasa:3.6.19-full

WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

EXPOSE 5005 5055

CMD ["sh", "-c", "rasa run -i 0.0.0.0 -p 5005 --enable-api --cors '*' --debug & rasa run actions -p 5055 && wait"]
