# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :card_game,
  ecto_repos: [CardGame.Repo]

# Configures the endpoint
config :card_game, CardGame.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "a1F6zALBNFAdi+iqQGghZkMAc/1huvKrI1yrMAdaVkquFIq+qqua+0rdpXWxCJme",
  render_errors: [view: CardGame.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CardGame.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
