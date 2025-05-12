# Gunakan image resmi Rasa sesuai versi Anda
FROM rasa/rasa:3.6.19-full

# Salin semua file proyek ke dalam container
COPY . /app
WORKDIR /app

# Install dependency tambahan jika ada
# (Hanya kalau Anda menggunakan custom actions di folder /actions)
RUN pip install --no-cache-dir -r requirements.txt || true

# Expose port Rasa core dan action server
EXPOSE 5005 5055

# Jalankan rasa server dan action server secara paralel dengan menggunakan '&&'
CMD rasa run --enable-api --cors '*' --port 5005 & rasa run actions --port 5055
