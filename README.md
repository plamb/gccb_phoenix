# Build Dockerfile.Build
The first thing lets send the Dockerfile.elixir to be built and sent to storage.

```
gcloud container builds submit --tag gcr.io/glass-approach-90218/elixir-mix .
```
