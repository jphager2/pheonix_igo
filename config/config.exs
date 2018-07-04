# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :pheonix_igo,
  ecto_repos: [PheonixIgo.Repo]

# Configures the endpoint
config :pheonix_igo, PheonixIgoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IluSJXP8zRq5N9kPSwmYQi0PGRGY8c+hD//2ordQ1jWU3XvB5x46LSsp3xLseQnO",
  render_errors: [view: PheonixIgoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PheonixIgo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"