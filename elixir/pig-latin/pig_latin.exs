defmodule PigLatin do
  @vowels ["a", "e", "i", "o", "u", "yt", "xr"]
  @consonants for(n <- ?a..?z, do: <<n::utf8>>) -- @vowels ++ ["ch", "qu", "squ", "th", "thr", "sch"]
  @magic_consonants ["x", "y"]

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
  def translate(phrase) do
    String.split(phrase)
    |> do_translate()
    |> Enum.join()
  end

  @spec do_translate(word :: String.t()) :: list(String.t())
  defp do_translate(word) when is_binary(word), do: String.split(word, "", trim: true) |> do_translate("")

  @spec do_translate(phrase :: list(String.t())) :: list(String.t())
  defp do_translate([word | rest_of_phrase]), do: [do_translate(word) | do_translate(rest_of_phrase)]
  defp do_translate([]), do: []

  # TODO: Most probabaly `vowel?/1` and `consonant?/1` can be translated to guards with `in`

  defp do_translate(word, "") when is_list(word) do
    [letter | rest] = word
    cond do
      vowel?(letter) ->
        word <> "ay"
      consonant?(letter) ->
        translate_word(rest, letter)
    end
  end

  defp translate_word(word, acc) when is_list(word) do
    [letter | rest] = word
    cond do
      vowel?(letter) ->
        word <> acc <> "ay"
      consonant?(letter) ->
        translate_word(rest, acc <> letter)
    end
  end

  @spec append(word :: String.t(), addition :: String.t()) :: String.t()
  defp append(word, addition), do: word <> addition

  @spec swap(word :: String.t(), to_swap :: String.t()) :: String.t()
  defp swap(word, to_swap) do
    {beginning, ending} = String.split_at(word, String.length(to_swap))
    ending <> beginning
  end

  @spec consonant(word :: String.t()) :: boolean()
  defp consonant(word), do: Enum.find(@consonants, fn(c) -> String.starts_with?(word, c) end)

  @spec consonant?(word :: String.t()) :: boolean()
  defp consonant?(word), do: String.starts_with?(word, @consonants)

  @spec vowel?(word :: String.t()) :: boolean()
  defp vowel?(word), do: String.starts_with?(word, @vowels)
end
