defmodule DiscordSheikah.Util do
  require Logger

  def one_to(n), do: Enum.random(1..n) <= 1
  def percent(n), do: Enum.random(1..100) <= n

  def random_picker(message) do
    [_ | choices] = message |> String.split

    cond do
      length(choices) >= 2 ->
        choices = choices |> Enum.join(" ") |> String.split(", ")
        Enum.random(choices)
      true -> ""
    end
  end

  def bingo_builder(message) do
    seed = Float.ceil(999999 * :rand.uniform) |> round

    variables = message |> String.split

    {category, len} = case length(variables) do
      1 -> {"normal", nil}
      2 ->
        [_, category] = variables
        {category, nil}
      3 ->
        [_ | cat_n_len] = variables
        [category, len] = cat_n_len
        {category, len}
      _ -> {:error, nil}
    end

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
