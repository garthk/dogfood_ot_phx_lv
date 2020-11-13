# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dogfood,
  ecto_repos: [Dogfood.Repo]

pg_url = System.get_env("PG_URL") || "dogfood:dogfood@127.0.0.1"
pg_database = System.get_env("PG_DATABASE") || "dogfood_dev"

config :dogfood, Dogfood.Repo,
  database: pg_database,
  url: "ecto://#{pg_url}/#{pg_database}"

# Configures the endpoint
config :dogfood, DogfoodWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RliSGD+rVQ5tn7ZLTh89nUOlXg5/auXi/9ZbI6V7vEnL50e9gV2gZuOQ/wsas4nV",
  render_errors: [view: DogfoodWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Dogfood.PubSub,
  live_view: [signing_salt: "PK9U41Xh"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# You can also supply opentelemetry resources using environment variables, eg.:
# OTEL_RESOURCE_ATTRIBUTES=service.name=name,service.namespace=namespace

config :opentelemetry, :resource,
  service: [
    name: "service-name",
    namespace: "service-namespace"
  ]

config :opentelemetry,
  tracer: :otel_tracer_default,
  processors: [
    otel_batch_processor: %{
      exporter:
        {OpenTelemetry.Honeycomb.Exporter,
         http_module: OpenTelemetry.Honeycomb.Http.HackneyBackend,
         http_options: [],
         write_key: System.get_env("HONEYCOMB_WRITEKEY")}
    }
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
