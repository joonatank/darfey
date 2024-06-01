# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :darfey,
  ecto_repos: [Darfey.Repo]

config :darfey, Darfey.Auth.Guardian,
  issuer: "darfey",
  secret_key: "WKhA8BKJXMdaAHkywBtj06osRHgSISnQlU5JSXclpD/CzAbF3Xlpti+/gaNI81L4"

# Configures the endpoint
config :darfey, DarfeyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O4/hw5B3LBL25/YkD2f8rIjMVA+GxB0ru/hcE2F2TuqlW25bxDGx6/kfSc8vCeGN",
  render_errors: [view: DarfeyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Darfey.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
