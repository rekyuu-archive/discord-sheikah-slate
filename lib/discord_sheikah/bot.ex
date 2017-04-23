defmodule DiscordSheikah.Bot do
  require Logger

  def start_link(opts \\ []) do
    HTTPoison.start
    Logger.warn "Manually started HTTPoison."

    Logger.info "Starting bot..."
    {:ok, _pid} = DiscordEx.Client.start_link(%{
      token: Application.get_env(:discord_sheikah, :discord_token),
      handler: DiscordSheikah.Handler
    })
  end
end
