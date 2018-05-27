defmodule ProteinTranslation do
  @type protein :: String.t()
  @type codon :: String.t()

  @codons %{
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
  def of_rna(rna) do
    with {:ok, codons} <- split(rna),
         {:ok, proteins} <- of_codon(codons),
         {:ok, proteins_splitted} <- split(proteins),
         do: {:ok, proteins_splitted}
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
  @spec of_codon(codon :: codon) :: {atom, protein}
  def of_codon(codon) when is_binary(codon) do
    # Use `with` to specify custom error reason in `else`
    with {:ok, protein} <- Map.fetch(@codons, codon) do
      {:ok, protein}
    else
      :error ->
        {:error, "invalid codon"}
    end
  end

  @spec of_codon(codons :: list(codon)) :: {atom, list(protein)}
  def of_codon(codons) when is_list(codons) do
    protein_mapping = for codon <- codons, do: of_codon(codon)

    case List.keymember?(protein_mapping, :error, 0) do
      false ->
        {:ok, Enum.map(protein_mapping, fn({_, protein}) -> protein end)}
      true ->
        {:error, "invalid RNA"}
    end
  end

  @spec split(rna :: String.t()) :: {atom, list(codon)}
  defp split(rna) when is_binary(rna) do
    case rem(String.length(rna), 3) do
      0 -> {:ok, rna |> String.upcase() |> String.split(~r/[A-Z]{3}/, include_captures: true, trim: true)}
      _ -> {:error, "invalid RNA"}
    end
  end

  @spec split(proteins :: list(protein)) :: {atom, list(protein)}
  defp split(proteins) when is_list(proteins) do
    {head, _} = 
      Enum.split_while(proteins, fn
        "STOP" -> false
        _ -> true
      end)

    {:ok, head}
  end
end
