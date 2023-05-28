defmodule Verity.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      VerityWeb.Telemetry,
      # Start the Ecto repository
      Verity.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Verity.PubSub},
      # Start Finch
      {Finch, name: Verity.Finch},
      # Start the Endpoint (http/https)
      VerityWeb.Endpoint
      # Start a worker by calling: Verity.Worker.start_link(arg)
      # {Verity.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Verity.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    VerityWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
