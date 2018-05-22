defmodule SecretHandshake do
  use Bitwise

  @bit_map  %{0b1 => "wink", 0b10 => "double blink", 0b100 => "close your eyes", 0b1000 => "jump"}
  @bit_reverse 0b10000

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
    decode(code) |> reverse(code &&& @bit_reverse)
  end

  @spec set?(flags :: integer, check :: integer) :: boolean()
  defp set?(flags, check) do
    band(flags, check) == check
  end

  @spec decode(code :: integer) :: list(String.t())
  defp decode(code) do
    for {key, val} <- @bit_map,
        set?(code, key) do
      val
    end
  end

  @spec reverse(secret :: list(String.t()), @bit_reverse :: integer) :: list(String.t())
  defp reverse(secret, @bit_reverse) do
    Enum.reverse(secret)
  end

  @spec reverse(secret :: list(String.t()), _code :: integer) :: list(String.t())
  defp reverse(secret, _code) do
    secret
  end
end
