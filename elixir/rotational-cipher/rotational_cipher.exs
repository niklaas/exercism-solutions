defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    for <<c <- text>> do
      cond do
        c in ?a..?z -> <<shifter(c, shift, ?a..?z)>>
        c in ?A..?Z -> <<shifter(c, shift, ?A..?Z)>>
        true -> <<c>>
      end
    end |> Enum.join()
  end
  
  @spec shifter(from :: integer, shift :: integer, within :: Range.t()) :: integer
  defp shifter(from, shift, within) do
    first.._last = within
    Stream.cycle(within)
    |> Enum.at(from + shift - first)  # Enum.at/1 looks up by *index*
  end
end
