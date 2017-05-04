defmodule DiscordSheikah.Bot do
  use DiscordSheikah.Module
  import DiscordSheikah.Util

  def handle_event({:MESSAGE_CREATE, {msg}, _ws_state}, state) do
    command = msg.content |> String.split |> List.first

    case command do
      "!help"   -> reply "https://github.com/rekyuu/discord-sheikah-slate"
      "!ping"   -> reply "Pong!"
      "!bingo"  -> reply bingo_builder(msg.content)
      "!map"    -> reply "http://www.zeldadungeon.net/breath-of-the-wild-interactive-map/"
      "!guide"  -> reply "https://docs.google.com/spreadsheets/d/1qLOC3ajm6a-vrXvlwAecbhW88iT8vtv9iSvP0jUcwzY/edit?usp=sharing"
      _ -> :ignore
    end

    {:ok, state}
  end

  def handle_event(_, state) do
    {:ok, state}
  end
end
