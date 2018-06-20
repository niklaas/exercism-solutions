defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size) do
    do_slices(s, size)
  end

  defp do_slices(s, size) when size <= 0 do
    []
  end

  defp do_slices(s, size) do
    for n <- 0..String.length(s)-1 do
      String.slice(s, n, size)
    end
    |> Enum.filter(fn(x) -> String.length(x) == size end)
  end
end
