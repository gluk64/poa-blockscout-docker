use Mix.Config

# Configure your database
config :explorer, Explorer.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "explorer_dev",
  hostname: "postgres",
  username: "postgres",
  password: "blockscout",
  loggers: [Explorer.Repo.PrometheusLogger],
  pool_size: 20,
  pool_timeout: 60_000,
  timeout: 80_000
