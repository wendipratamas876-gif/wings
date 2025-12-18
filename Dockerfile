FROM ghcr.io/pterodactyl/wings:latest

# Install supervisor + dependencies lain kalau perlu
RUN apk add --no-cache supervisor curl

# Buat directory config + volumes
RUN mkdir -p /etc/pterodactyl /var/lib/pterodactyl/volumes /var/lib/pterodactyl/rustic-repos /var/log/pterodactyl

# Copy supervisord.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy config.yml lo (pake yang lo kasih tadi)
COPY config.yml /etc/pterodactyl/config.yml

# Expose ports (API + SFTP + game ports kalau perlu)
EXPOSE 8080 8443 2022

# Jalankan supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
