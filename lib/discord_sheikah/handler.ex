defmodule DiscordSheikah.Handler do
  use DiscordSheikah.Module
  import DiscordSheikah.Util

  handle :message_create do
    command "!ping", do: reply "Pong!"

    command "!coin", do: reply Enum.random(["Heads.", "Tails."])

    command ["!pick", "!random", "!choose"] do
      choices = message_split |> Enum.join(" ") |> String.split(", ")
      reply Enum.random(choices)
    end

    command "!bingo" do
      cond do
        length(message_split) == 0 ->
          reply bingo_builder("normal", nil)
        length(message_split) == 1 ->
          [category] = message_split
          reply bingo_builder(category, nil)
        length(message_split) == 2 ->
          [category, len] = message_split
          reply bingo_builder(category, len)
        true -> nil
      end
    end

    command "!map" do
      reply "http://www.zeldadungeon.net/breath-of-the-wild-interactive-map/"
    end

    command "!guide" do
      reply "https://docs.google.com/spreadsheets/d/1qLOC3ajm6a-vrXvlwAecbhW88iT8vtv9iSvP0jUcwzY/edit?usp=sharing"
    end

    match ["same", "Same", "SAME"] do
      if one_to(25) do
        reply "same"
      end
    end
  end

  handle _, do: nil
end
