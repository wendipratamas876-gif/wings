FROM ghcr.io/pterodactyl/wings:latest

# Install supervisor
RUN apk add --no-cache supervisor

# Copy config supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Buat folder config wings (harus ada)
RUN mkdir -p /etc/pterodactyl

# Copy config.yml kamu (nanti lo isi manual atau dari env)
COPY config.yml /etc/pterodactyl/config.yml

# Jalankan supervisor sebagai entrypoint
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
