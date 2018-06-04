defmodule Bob do
  def hey(input) do
    cond do
      # Saying nothing
      nothing?(input) ->
        "Fine. Be that way!"

      # Yelling a question
      yelling?(input) && asking?(input) ->
        "Calm down, I know what I'm doing!"

      # Yelling
      yelling?(input) ->
        "Whoa, chill out!"

      # Asking
      asking?(input) ->
        "Sure."

      # Everything else
      true ->
        "Whatever."
    end
  end

  defp asking?(input), do: String.ends_with?(input, "?")
  defp nothing?(input), do: String.split(input) == []
  defp yelling?(input), do: input == String.upcase(input) && has_letters?(input)
  defp has_letters?(input), do: Regex.match?(~r(\pL), input)
end
