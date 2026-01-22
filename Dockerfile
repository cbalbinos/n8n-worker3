FROM n8nio/n8n:1.123.11

USER root

# mesmo preparo do volume
RUN mkdir -p /n8n && chown -R node:node /n8n

ENV N8N_USER_FOLDER=/n8n
ENV EXECUTIONS_MODE=queue
ENV OFFLOAD_MANUAL_EXECUTIONS_TO_WORKERS=true
ENV GENERIC_TIMEZONE=America/Sao_Paulo

USER node

CMD ["n8n", "worker"]
