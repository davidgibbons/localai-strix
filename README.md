# LocalAI Strix Container

Custom container build for LocalAI backends with ROCm base image.

Based on the toolbox image: docker.io/kyuz0/amd-strix-halo-toolboxes:rocm-7.1.1-rocwmma

## Backend Gallery

This repo publishes a Strix Halo backend gallery.

Use this URL as your backend index:

```
https://raw.githubusercontent.com/davidgibbons/localai-strix/main/strix.yaml
```

Run example:

```sh
docker run --rm -p 8080:8080 \
  -e LOCALAI_BACKEND_GALLERIES='[{"name":"strix","url":"https://raw.githubusercontent.com/davidgibbons/localai-strix/main/strix.yaml"}]' \
  -v $(pwd)/models:/models \
  -v $(pwd)/backends:/backends \
  ghcr.io/davidgibbons/localai-strix:latest
```

The gallery lives in `strix.yaml`.

## Build and Publish

GitHub Actions builds and publishes images to:

- `ghcr.io/davidgibbons/localai-backends:latest-strix-llamacpp-*`
