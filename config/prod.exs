use Mix.Config

# this has been updated for distillery
# see: https://hexdocs.pm/distillery/use-with-phoenix.html#configuring-your-release
config :myapp, MyPhoenixApp.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "localhost", port: {:system, "PORT"}],
  cache_static_manifest: "priv/static/manifest.json",
  server: true,
  root: ".",
  version: Mix.Project.config[:version]

# Do not print debug messages in production
config :logger, level: :info

# out sample doesn't have a prod.secret.exs so comment it out
# import_config "prod.secret.exs"
