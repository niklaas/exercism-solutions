defmodule Accumulate do
  @doc """
    Given a list and a function, apply the function to each list item and
    replace it with the function's return value.

    Returns a list.

    ## Examples

      iex> Accumulate.accumulate([], fn(x) -> x * 2 end)
      []

      iex> Accumulate.accumulate([1, 2, 3], fn(x) -> x * 2 end)
      [2, 4, 6]

  """

  @spec accumulate(list, (any -> any)) :: list
  def accumulate(list, fun) do
    do_accumulate(list, fun, [])
  end

  @spec do_accumulate(list :: list, fun :: (any -> any), list) :: list
  defp do_accumulate(list, fun, acc)

  defp do_accumulate([], _fun, []) do
    []
  end

  defp do_accumulate([], _fun, acc) do
    Enum.reverse(acc)
  end

  defp do_accumulate([head | tail], fun, acc) do
    do_accumulate(tail, fun, [fun.(head) | acc])
  end
end
