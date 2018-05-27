defmodule ProteinTranslation do
  @lookup_table %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(""), do: {:ok, []}

  def of_rna(rna) do
    {current, rest} = String.split_at(rna, 3)

    case of_codon(current) do
      {:ok, "STOP"} ->
        {:ok, []}

      {:error, _} ->
        {:error, "invalid RNA"}

      {:ok, current_result} ->
        case of_rna(rest) do
          {:error, error} -> {:error, error}
          {:ok, rest_result} -> {:ok, [current_result | rest_result]}
        end
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(codon :: String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    # Use `with` to specify custom error reason in `else`
    with {:ok, protein} <- Map.fetch(@lookup_table, codon) do
      {:ok, protein}
    else
      :error ->
        {:error, "invalid codon"}
    end
  end
end
