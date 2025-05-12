# Gunakan image resmi Rasa sesuai versi Anda
FROM rasa/rasa:3.6.19-full

# Install supervisor
RUN apt-get update && apt-get install -y supervisor

# Salin semua file proyek ke dalam container
COPY . /app
WORKDIR /app

# Install dependency tambahan jika ada
RUN pip install --no-cache-dir -r requirements.txt || true

# Salin file konfigurasi supervisord ke dalam container
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose port untuk Rasa core dan action server
EXPOSE 5005 5055

# Jalankan supervisord untuk mengelola kedua proses
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
