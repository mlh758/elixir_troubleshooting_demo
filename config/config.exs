# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

# Configures the endpoint
config :misbehave, MisbehaveWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: MisbehaveWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Misbehave.PubSub,
  live_view: [signing_salt: "4sqfs5EX"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# This is using a hard coded directory for priv dir... update this for your
# local computer or maybe I'll make this configurable later.
config :esshd,
  enabled: true,
  priv_dir: "/Users/mharris/GitHub/misbehave/priv",
  handler: :elixir,
  port: 10_022,
  public_key_authenticator: "Sshd.PublicKeyAuthenticator.AuthorizedKeys"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
