# LocalAI Strix Container

Custom container build for LocalAI backends with ROCm base image.

Based on the toolbox image: docker.io/kyuz0/amd-strix-halo-toolboxes:rocm-7.1.1-rocwmma

## Backend Gallery

This repo publishes a backend index that mirrors upstream LocalAI backends and appends Strix Halo-specific entries.

Use this URL as your backend index:

```
https://raw.githubusercontent.com/davidgibbons/localai-strix/main/index.yaml
```

Run example:

```sh
docker run --rm -p 8080:8080 \
  -e BACKENDS_URL=https://raw.githubusercontent.com/davidgibbons/localai-strix/main/index.yaml \
  -v $(pwd)/models:/models \
  -v $(pwd)/backends:/backends \
  ghcr.io/davidgibbons/localai-strix:latest
```

Custom entries live in `strix_gallery.yaml`. The workflow `.github/workflows/update-index.yaml` keeps `index.yaml` in sync with upstream and appends the Strix entries.

## Build and Publish

GitHub Actions builds and publishes images to:

- `ghcr.io/davidgibbons/localai-backends:latest-strix-llamacpp-*`

