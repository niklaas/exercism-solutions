defmodule RNATranscription do
  @translator %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    do_to_rna(dna)
  end

  defp do_to_rna([]) do
    []
  end

  defp do_to_rna([head | tail]) do
    [Map.get(@translator, head) | do_to_rna(tail)]
  end
end
