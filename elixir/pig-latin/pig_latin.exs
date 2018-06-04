defmodule PigLatin do
  @vowels [?a, ?e, ?i, ?o, ?u]

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
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase), do: phrase |> String.split() |> do_phrase()

  @spec do_phrase(phrase :: list(String.t())) :: String.t()
  defp do_phrase(phrase)
  defp do_phrase([word | []]), do: do_word(word)
  defp do_phrase([word | rest]), do: do_word(word) <> " " <> do_phrase(rest)

  @spec do_word(word :: String.t()) :: String.t()
  defp do_word(word) do
    case word do
      # vowels or special case x and y followed by consonant
      <<h, m, _t::binary>> when h in @vowels
                           when h in [?x, ?y] and m not in @vowels ->
        word <> "ay"

      # special case: qu
      <<?q, ?u, t::binary>> ->
        do_word(t <> "qu")

      # consonants
      <<h, t::binary>> ->
        do_word(t <> <<h>>)
    end
  end
end
