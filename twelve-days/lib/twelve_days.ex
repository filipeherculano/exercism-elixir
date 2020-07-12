defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number), do: get_phrase(number)

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) when starting_verse == ending_verse,
    do: get_phrase(starting_verse)

  def verses(starting_verse, ending_verse),
    do: get_phrase(starting_verse) <> "\n" <> verses(starting_verse + 1, ending_verse)

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing, do: verses(1, 12)

  defp get_phrase(day),
    do: "On the #{get_ordinal(day)} day of Christmas my true love gave to me: #{get_cardinal(day)} in a Pear Tree."

  defp get_ordinal(1), do: "first"
  defp get_ordinal(2), do: "second"
  defp get_ordinal(3), do: "third"
  defp get_ordinal(4), do: "fourth"
  defp get_ordinal(5), do: "fifth"
  defp get_ordinal(6), do: "sixth"
  defp get_ordinal(7), do: "seventh"
  defp get_ordinal(8), do: "eighth"
  defp get_ordinal(9), do: "ninth"
  defp get_ordinal(10), do: "tenth"
  defp get_ordinal(11), do: "eleventh"
  defp get_ordinal(12), do: "twelfth"

  defp get_cardinal(1), do: "a Partridge"
  defp get_cardinal(2), do: "two Turtle Doves, and " <> get_cardinal(1)
  defp get_cardinal(3), do: "three French Hens, " <> get_cardinal(2)
  defp get_cardinal(4), do: "four Calling Birds, " <> get_cardinal(3)
  defp get_cardinal(5), do: "five Gold Rings, " <> get_cardinal(4)
  defp get_cardinal(6), do: "six Geese-a-Laying, " <> get_cardinal(5)
  defp get_cardinal(7), do: "seven Swans-a-Swimming, " <> get_cardinal(6)
  defp get_cardinal(8), do: "eight Maids-a-Milking, " <> get_cardinal(7)
  defp get_cardinal(9), do: "nine Ladies Dancing, " <> get_cardinal(8)
  defp get_cardinal(10), do: "ten Lords-a-Leaping, " <> get_cardinal(9)
  defp get_cardinal(11), do: "eleven Pipers Piping, " <> get_cardinal(10)
  defp get_cardinal(12), do: "twelve Drummers Drumming, " <> get_cardinal(11)
end
