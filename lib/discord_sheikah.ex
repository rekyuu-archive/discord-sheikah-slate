defmodule DiscordSheikah do
  use Application
  use Supervisor
  require Logger

  def start(_type, _args) do
    Logger.info "Starting supervisor..."

    children = [supervisor(DiscordSheikah.Bot, [[name: DiscordSheikah.Bot]])]
    {:ok, _pid} = Supervisor.start_link(children, strategy: :one_for_one)
  end
end