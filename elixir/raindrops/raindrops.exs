defmodule Raindrops do
  @raindrops [
    {3, "Pling"},
    {5, "Plang"},
    {7, "Plong"}
  ]

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    do_sound(number, @raindrops, "")
  end

  defp do_sound(number, [head | tail], acc) when rem(number, elem(head, 0)) == 0 do
    do_sound(number, tail, acc <> elem(head, 1))
  end

  defp do_sound(number, [_head | tail], acc) do
    do_sound(number, tail, acc)
  end

  defp do_sound(number, [], "") do
    Integer.to_string(number)
  end

  defp do_sound(_number, [], acc) do
    acc
  end

end
