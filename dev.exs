use Mix.Config

# Configure your database
config :explorer, Explorer.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "explorer_dev",
  hostname: "postgres",
  username: "blockscout",
  password: "blockscout",
  loggers: [],
  pool_size: 20,
  pool_timeout: 60_000,
  timeout: 80_000

import_config "dev.secret.exs"

variant =
  if is_nil(System.get_env("ETHEREUM_JSONRPC_VARIANT")) do
    "parity"
  else
    System.get_env("ETHEREUM_JSONRPC_VARIANT")
    |> String.split(".")
    |> List.last()
    |> String.downcase()
  end

# Import variant specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "dev/#{variant}.exs"