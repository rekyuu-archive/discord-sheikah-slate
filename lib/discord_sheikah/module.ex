defmodule DiscordSheikah.Module do
  use Nostrum.Consumer
  alias Nostrum.Api

  defmacro __using__(_opts) do
    quote do
      import DiscordSheikah.Module
      use Nostrum.Consumer
      alias Nostrum.Api

      def start_link, do: Consumer.start_link(__MODULE__)
    end
  end

  defmacro reply(text) do
    quote do
      Api.create_message(var!(msg).channel_id, unquote(text))
    end
  end
end
