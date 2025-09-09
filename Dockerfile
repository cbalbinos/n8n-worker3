# Base n8n
FROM n8nio/n8n:1.110.1

# Limpar possíveis pacotes duplicados ao iniciar e instalar o pacote community node
RUN rm -rf /home/node/.n8n/nodes/node_modules/n8n-nodes-evolution-api || true \
    && npm install -g n8n-nodes-evolution-api

# Configuração do Worker
ENV EXECUTIONS_MODE=queue
ENV OFFLOAD_MANUAL_EXECUTIONS_TO_WORKERS=true
ENV N8N_ENCRYPTION_KEY=$ENCRYPTION_KEY
ENV GENERIC_TIMEZONE=America/Sao_Paulo
ENV N8N_LOG_LEVEL=debug

# Inicialização do Worker
CMD ["n8n", "worker"]
