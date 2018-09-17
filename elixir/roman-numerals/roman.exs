defmodule Roman do
  @numerals [
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
    do_numerals(number, @numerals)
  end

  @spec do_numerals(num:: integer(), tuples :: list(tuple())) :: String.t()
  defp do_numerals(num, [curr | rest]) do
    {curr_num, curr_rom} = curr
    {rom, rem} = do_lookup(num, curr_num, curr_rom)
    rom <> do_numerals(rem, rest)
  end

  defp do_numerals(_, []) do
    ""
  end

  defp do_lookup(num, curr_num, curr_rom) when rem(num, curr_num) == 0 do
    { curr_rom |> String.duplicate(div(num, curr_num)), 0 }
  end

  defp do_lookup(num, curr_num, curr_rom) do
    {
      curr_rom |> String.duplicate(div(num, curr_num)),
      rem(num, curr_num)
    }
  end
end
