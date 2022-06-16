defmodule Odin.Cnab do
  alias Odin.Users.Cnab

  alias Odin.Repo

  def save_cnab(cnab) do
    String.split(cnab, "\r\n")
    |> Enum.reduce([], &normalize_cnab/2)
    |> Enum.reduce([], &validate_cnab/2)
    |> Enum.each(&Repo.insert/1)
  end

  def normalize_cnab(cnab, acc) do
    normalize = %{
      "type" => String.slice(cnab, 0, 1),
      "date" => String.slice(cnab, 1, 8),
      "value" => String.slice(cnab, 9, 10),
      "cpf" => String.slice(cnab, 19, 11),
      "card_number" => String.slice(cnab, 30, 12),
      "hour" => String.slice(cnab, 42, 6),
      "store_owner" => String.slice(cnab, 48, 14),
      "store" => String.slice(cnab, 62, 19)
    }

    [normalize | acc]
  end

  def validate_cnab(cnab, acc) do
    changeset = Cnab.changeset(cnab)

    if changeset.valid?,
      do: [changeset | acc],
      else: acc
  end
end
