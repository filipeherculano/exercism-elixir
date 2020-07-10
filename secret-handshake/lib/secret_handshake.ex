defmodule SecretHandshake do
  use Bitwise, only_operators: true

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    []
    |> check_and_add(code &&& 0b1)
    |> check_and_add(code &&& 0b10)
    |> check_and_add(code &&& 0b100)
    |> check_and_add(code &&& 0b1000)
    |> check_and_add(code &&& 0b10000)
  end

  defp check_and_add(list, 0b1), do: list ++ ["wink"]
  defp check_and_add(list, 0b10), do: list ++ ["double wink"]
  defp check_and_add(list, 0b100), do: list ++ ["close your eyes"]
  defp check_and_add(list, 0b1000), do: list ++ ["jump"]
  defp check_and_add(list, 0b10000), do: Enum.reverse(list)
  defp check_and_add(list, _), do: list
end
