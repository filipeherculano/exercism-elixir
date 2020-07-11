defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.graphemes()
    |> Enum.map(fn
      <<x>> ->
        if x in [?!, ?&, ?@, ?$, ?%, ?^, ?&, ?:, ?,, ?_] do
          <<32>>
        else
          <<x>>
        end
      x -> x
    end)
    |> Enum.join()
    |> String.split()
    |> Enum.frequencies()
  end
end
