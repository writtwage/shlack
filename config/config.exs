# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :shlack,
  ecto_repos: [Shlack.Repo]

# Configures the endpoint
config :shlack, Shlack.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "beDWJyMsmTWhNucp8Z01ovzNMkr2yrhP+XqDHmwFzrNjoLETZrYPJ8eQG56O+z7h",
  render_errors: [view: Shlack.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Shlack.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures guardian
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "MyApp",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: to_string(Mix.env), # why is this substituted for <secret_key>
  serializer: MyApp.GuardianSerializer

# configs guardian_db
config :guardian_db, GuardianDb,
         repo: Shlack.Repo,
         schema_name: "tokens" # Optional, default is "guardian_tokens"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
