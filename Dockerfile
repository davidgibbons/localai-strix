FROM docker.io/kyuz0/amd-strix-halo-toolboxes:rocm-7.1.1-rocwmma

# Keep in sync with upstream LocalAI release tag.
ARG LOCALAI_VERSION=3.9.0

# Install necessary dependencies
RUN dnf install -y curl tar gzip

# Install LocalAI
RUN curl -L -o /tmp/local-ai https://github.com/mudler/LocalAI/releases/download/v${LOCALAI_VERSION}/local-ai-v${LOCALAI_VERSION}-linux-amd64 && \
    chmod +x /tmp/local-ai && \
    mv /tmp/local-ai /usr/local/bin/local-ai


RUN mkdir -p /models /backends

# Define the health check command
HEALTHCHECK --interval=1m --timeout=10m --retries=10 \
  CMD curl -f ${HEALTHCHECK_ENDPOINT} || exit 1

VOLUME /models /backends /configuration
EXPOSE 8080
ENTRYPOINT [ "/usr/local/bin/local-ai" ]
