defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> Kernel.<>(":")
    |> String.graphemes()
    |> Enum.reduce(
      {0, :none, []},
      fn
        curr, {0, :none, result} ->
          {1, curr, result}

        curr, {count, prev, result} when curr == prev ->
          {count + 1, curr, result}

        curr, {count, prev, result} when count == 1 ->
          {1, curr, List.flatten([prev | result])}

        curr, {count, prev, result} ->
          result = [
            prev |> Kernel.<>(Integer.to_string(count) |> String.reverse())
            | result
          ]

          {1, curr, List.flatten(result)}
      end
    )
    |> elem(2)
    |> List.to_string()
    |> String.reverse()
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    string
    |> String.graphemes()
    |> Enum.reduce(
      {"", ""},
      fn
        << byte >> = curr, {acc, result} when byte >= ?0 and byte <= ?9 ->
          {curr <> acc, result}

        curr, {acc, result} when acc == "" ->
          {acc, curr <> result}

          curr, {acc, result} ->
          acc = acc |> String.reverse() |> String.to_integer()
          result = String.duplicate(curr, acc) <> result

          {"", result}
      end
    )
    |> elem(1)
    |> String.reverse()
  end
end
