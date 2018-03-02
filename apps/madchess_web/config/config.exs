# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :madchess_web,
  namespace: MadchessWeb

# Configures the endpoint
config :madchess_web, MadchessWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LOsm4mvhcfEfD4s24uDcU4X3zQ1EY4pFoEJy0Ihmrop9wS9DYjSjl1WJLj7B/oVD",
  render_errors: [view: MadchessWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MadchessWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :madchess_web, :generators,
  context_app: :madchess

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
