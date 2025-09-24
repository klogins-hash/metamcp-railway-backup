# Use the same base image as the original MetaMCP
FROM ghcr.io/metatool-ai/metamcp:latest

# Set working directory
WORKDIR /app

# Copy the database backup
COPY metamcp_backup.sql /app/metamcp_backup.sql

# Copy initialization script
COPY init-db.sh /app/init-db.sh
RUN chmod +x /app/init-db.sh

# Expose the port
EXPOSE 12008

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:12008/health || exit 1

# Use the original entrypoint
CMD ["./docker-entrypoint.sh"]
