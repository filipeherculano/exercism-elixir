defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.splitter([" ", "_", "-"], trim: true)
    |> Enum.map(&to_charlist/1)
    |> Enum.map(&take_acronym(&1, Enum.any?(&1, fn letter -> letter >= ?a and letter <= ?z end)))
    |> Enum.map(fn [h | rest] -> [h] ++ Enum.filter(rest, fn c -> c >= ?A and c <= ?Z end) end)
    |> to_string()
    |> String.upcase()
  end

  defp take_acronym(charlist, false), do: [hd(charlist)]
  defp take_acronym(charlist, true), do: charlist
end
