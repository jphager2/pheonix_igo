# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_igo,
  ecto_repos: [PhoenixIgo.Repo]

# Configures the endpoint
config :phoenix_igo, PhoenixIgoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IluSJXP8zRq5N9kPSwmYQi0PGRGY8c+hD//2ordQ1jWU3XvB5x46LSsp3xLseQnO",
  render_errors: [view: PhoenixIgoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixIgo.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :phoenix_igo, DemoWeb.Gettext, default_locale: "en", locales: ~w(en cs)

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
