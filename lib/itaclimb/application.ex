defmodule Itaclimb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ItaclimbWeb.Telemetry,
      Itaclimb.Repo,
      {DNSCluster, query: Application.get_env(:itaclimb, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Itaclimb.PubSub},
      # Start a worker by calling: Itaclimb.Worker.start_link(arg)
      # {Itaclimb.Worker, arg},
      # Start to serve requests, typically the last entry
      ItaclimbWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Itaclimb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ItaclimbWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
