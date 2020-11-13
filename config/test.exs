use Mix.Config

pg_url = System.get_env("PG_URL") || "dogfood:dogfood@127.0.0.1"

pg_database =
  System.get_env("PG_DATABASE") || "dogfood_test#{System.get_env("MIX_TEST_PARTITION")}"

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :dogfood, Dogfood.Repo,
  database: pg_database,
  url: "ecto://#{pg_url}/#{pg_database}",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dogfood, DogfoodWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
