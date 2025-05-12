FROM rasa/rasa:3.6.19

# Salin semua file proyek ke dalam container
COPY . /app
WORKDIR /app

# Training model (opsional jika model sudah ada)
RUN rasa train

# Jalankan server Rasa
CMD ["run", "--enable-api", "--cors", "*", "--debug", "--port", "5055"]

