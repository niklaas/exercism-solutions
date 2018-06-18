defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split([" ", "-"], trim: true)
    |> Enum.map(&do_abbreviate/1)
    |> Enum.join("")
    |> String.upcase()
  end

  @spec do_abbreviate(word :: String.t()) :: String.t()
  defp do_abbreviate(word)

  defp do_abbreviate(<<first, rest::binary>>) do
    <<first>> <> uppercase_only(rest)
  end

  @spec uppercase_only(phrase :: String.t()) :: String.t()
  defp uppercase_only("") do
    ""
  end

  defp uppercase_only(<<letter, rest::binary>>) when letter in ?A..?Z do
    <<letter>> <> uppercase_only(rest)
  end

  defp uppercase_only(<<_letter, rest::binary>>) do
    uppercase_only(rest)
  end
end
