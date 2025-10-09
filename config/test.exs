import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :todoapp, Todoapp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "todoapp_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todoapp, TodoappWeb.Endpoint,
  http: [ip: {0,0,0,0}, port: 4002],
  secret_key_base: "6sD5awCc6Gd3Uw4PbvH75SGx7U3RL/GgnEOO3xdwMj14dce7yxtmp0q7OLo3XNpO",
  server: false

# In test we don't send emails
config :todoapp, Todoapp.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
