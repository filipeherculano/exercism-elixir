defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.graphemes()
    |> Enum.map(fn
      <<byte>> when byte >= ?a and byte <= ?z -> Integer.mod(byte - ?a + shift, 26) + ?a
      <<byte>> when byte >= ?A and byte <= ?Z -> Integer.mod(byte - ?A + shift, 26) + ?A
      grapheme -> grapheme
    end)
    |> List.to_string()
  end
end
