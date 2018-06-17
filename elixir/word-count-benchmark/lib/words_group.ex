# See submission http://exercism.io/submissions/25dae43efcab44c99f181d92712a203f
defmodule WordsGroup do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split([" ", "_", "@", "%", ".", "!", "?", "#", ",", "$", "^", "\"", ":", "&"], trim: true)
    |> Enum.group_by(&(&1))
    |> Enum.map(fn {k, v} -> {k, Enum.count(v)} end)
    |> Map.new()
  end
end