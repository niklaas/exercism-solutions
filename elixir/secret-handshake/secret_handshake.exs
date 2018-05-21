defmodule SecretHandshake do
  use Bitwise

  @binary_map  %{0b1 => "wink", 0b10 => "double blink", 0b100 => "close your eyes", 0b1000 => "jump"}

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    secret = Enum.filter(@binary_map, fn({key, _val}) -> set?(code, key) end)
    |> Enum.map(fn({_key, val}) -> val end)

    if reverse?(code), do: Enum.reverse(secret), else: secret
  end

  @spec set?(flags :: integer, check :: integer) :: boolean()
  def set?(flags, check) do
    band(flags, check) == check
  end

  @spec reverse?(code :: integer) :: boolean()
  def reverse?(code) do
    set?(code, 0b10000)
  end
end
