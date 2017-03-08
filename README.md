# Initial config

Add Distillery, mix release.init, and update config/prod.exs
Comment out prod.secrets.exs in config/prod.exs
Add dockerfile for elixir-mix
Add distillery plugin to rel/plugins/plugin.exs
Change version in rel/config.exs to append git hash to end of version string

# Build Dockerfile
The first thing lets send the Dockerfile.elixir to be built and sent to storage.

```
gcloud container builds submit --tag gcr.io/glass-approach-90218/elixir-mix .
```
