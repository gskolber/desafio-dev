defmodule Odin.Users.Cnab do
  use Ecto.Schema
  import Ecto.Changeset

  @params [:type, :date, :value, :cpf, :card_number, :hour, :store_owner, :store]

  schema "cnab" do
    field :date, :string
    field :value, :float
    field :cpf, :string
    field :card_number, :string
    field :hour, :string
    field :store_owner, :string
    field :store, :string
    field :type, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |>cast(params, @params)
    |>transform_value()

  end

  def transform_value(changeset) do
    changeset
    |>change(value: changeset.changes.value/100)
  end
end
