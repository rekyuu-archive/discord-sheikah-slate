defmodule DiscordSheikah.Util do
  require Logger

  def one_to(n), do: Enum.random(1..n) <= 1
  def percent(n), do: Enum.random(1..100) <= n

  def bingo_builder(category, len) do
    seed = Float.ceil(999999 * :rand.uniform) |> round

    base = case category do
      "short"   -> "http://botw.site11.com/?seed=#{seed}&mode=short"
      "normal"  -> "http://botw.site11.com/?seed=#{seed}"
      "long"    -> "http://botw.site11.com/?seed=#{seed}&mode=long"
      "plateau" -> "http://botw.site11.com/gp.html?seed=#{seed}"
      "korok"   -> "http://botw.site11.com/korok.html?seed=#{seed}"
      "shrine"  -> "http://botw.site11.com/shrine.html?seed=#{seed}"
      "comp"    -> "http://botw.site11.com/comp.html?seed=#{seed}"
      _ -> nil
    end

    cond do
      Enum.member?(["short", "long"], category) -> base
      true ->
        case len do
          nil -> base
          len -> base <> "&mode=#{len}"
        end
    end
  end
end
