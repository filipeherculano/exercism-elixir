defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    s
    |> String.graphemes()
    |> do_slices(size)
  end

  defp do_slices(s, size) when size <= 0, do: []
  defp do_slices(s, size) when size > length(s), do: []
  defp do_slices(s, size), do: first(s, size)

  defp first(current, size) when size > length(current), do: []
  defp first([_h | rest] = current, size) do
    {split, _} = current |> List.to_string() |> String.split_at(size)
    [split] ++ first(rest, size)
  end
end
