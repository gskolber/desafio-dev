defmodule Odin.Users.Cnab do
  use Ecto.Schema
  import Ecto.Changeset

  @params [:type, :date, :value, :cpf, :card_number, :hour, :store_owner, :store]

  schema "cnab" do
    field :type, :string
    field :date, :string
    field :value, :float
    field :cpf, :string
    field :card_number, :string
    field :hour, :string
    field :store_owner, :string
    field :store, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |>cast(params, @params)
  end
end
