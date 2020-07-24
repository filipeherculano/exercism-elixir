defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """

  @vowels ~w(a b c d e)
  @vowels_like ~w(yt xr)
  @consonant_groups ~w(ch qu squ th thr sch)

  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    cond do
      String.starts_with?(phrase, @vowels ++ @vowels_like) -> phrase <> "ay"
        String.starts_with?(phrase, @consonant_groups) -> # rule 2
          String.match?(phrase, ~r/*qu*/) -> Regex.replace(~r/(.*qu)(.*)/, phrase, "")
            test_rule_4(phrase) -> Regex.replace(~r/(.*)(y.*)/, phrase, "\\1\\0ay")
        true -> phrase
    end
  end

  defp test_rule_4(phrase) do
    Regex.named_captures(~r/(?<lead>*y).*/, phrase)
    |> Map.get("lead")
    |> to_char_list
    |> Enum.any?(&Kernel.in(&1, @vowels))
  end
end
