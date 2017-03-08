# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :myapp,
  namespace: MyPhoenixApp

# Configures the endpoint
config :myapp, MyPhoenixApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eBFZPmwnG3Clg7dGgA5P9WOXnDwE12f/2zumkU/OtFl32sW61D6g+mFLi6JWATC+",
  render_errors: [view: MyPhoenixApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyPhoenixApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
