# See submission http://exercism.io/submissions/9ab26df6eb264ac3895f65db3d719658
defmodule WordsReduce do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/[^\w\d-]|_/u, trim: true)
    |> Enum.reduce(%{}, &collect_words/2)
  end

  def collect_words(word, acc) do
    acc
    |> Map.update(word, 1, &(&1 + 1))
  end
end
