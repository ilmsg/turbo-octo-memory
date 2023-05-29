defmodule TurboOctoMemory.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TurboOctoMemoryWeb.Telemetry,
      # Start the Ecto repository
      TurboOctoMemory.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: TurboOctoMemory.PubSub},
      # Start Finch
      {Finch, name: TurboOctoMemory.Finch},
      # Start the Endpoint (http/https)
      TurboOctoMemoryWeb.Endpoint
      # Start a worker by calling: TurboOctoMemory.Worker.start_link(arg)
      # {TurboOctoMemory.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TurboOctoMemory.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TurboOctoMemoryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
