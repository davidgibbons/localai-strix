# LocalAI Strix Container

Custom container build for LocalAI with ROCm base image.

## Version

The LocalAI version is pinned in `Dockerfile` as `ARG LOCALAI_VERSION` and is updated automatically by GitHub Actions when new upstream releases are published.

## Build and Publish

GitHub Actions builds and publishes images to:

- `ghcr.io/davidgibbons/localai-strix:latest`
- `ghcr.io/davidgibbons/localai-strix:<LOCALAI_VERSION>`

## Run

Example:

```sh
docker run --rm -p 8080:8080 \
  -v $(pwd)/models:/models \
  -v $(pwd)/backends:/backends \
  ghcr.io/davidgibbons/localai-strix:latest
```

## Healthcheck

The container expects `HEALTHCHECK_ENDPOINT` to be set for the Docker healthcheck.
