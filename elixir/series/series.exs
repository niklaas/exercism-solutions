defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size), do: s |> String.codepoints() |> do_slices(size)

  defp do_slices(cp, size)
      when size <= 0
      when size > length(cp),
    do: []

  defp do_slices([_head | tail] = cp, size) do
    [ Enum.slice(cp, 0, size) |> Enum.join() ] ++ do_slices(tail, size)
  end
end
