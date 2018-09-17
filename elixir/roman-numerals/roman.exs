defmodule Roman do
  @nrl [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {80, "XXC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"},
  ]

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    do_numerals(number, @nrl)
  end

  @spec do_numerals(num:: pos_integer(), tuples :: list(tuple())) :: String.t()
  defp do_numerals(num, [curr | rest]) do
    {curr_num, curr_rom} = curr
    {hits, rem} = do_hits_rem(num, curr_num)
    String.duplicate(curr_rom, hits) <> do_numerals(rem, rest)
  end

  defp do_numerals(_, []) do
    ""
  end

  @spec do_hits_rem(num :: pos_integer(), curr_num :: pos_integer()) :: tuple()
  defp do_hits_rem(num, curr_num) do
    { div(num, curr_num), rem(num, curr_num) }
  end
end
