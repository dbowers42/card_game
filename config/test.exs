use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :card_game, CardGame.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :card_game, CardGame.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "card_game_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
