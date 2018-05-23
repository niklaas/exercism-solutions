defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: accumulate(list, fun, true, [])

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: accumulate(list, fun, false, [])

  @spec accumulate(list :: list(any), fun :: (any -> boolean), result :: boolean, acc :: list(any)) :: list(any)
  defp accumulate([head | tail], fun, result, acc) do
    accumulate(tail, fun, result, acc ++ check(head, fun, result))
  end
  defp accumulate(_list, _fun, _result, acc), do: acc

  @spec check(val :: any, fun :: (any -> boolean), result :: boolean) :: list(any)
  defp check(val, fun, result) do
    case apply(fun, [val]) do
      ^result -> [val]
      _ -> []
    end
  end
end
