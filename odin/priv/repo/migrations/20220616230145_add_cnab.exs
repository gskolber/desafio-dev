defmodule Odin.Repo.Migrations.AddCnab do
  use Ecto.Migration

  def change do
    create table(:cnab) do
      add :type, :string
      add :date, :string
      add :value, :float
      add :cpf, :string
      add :card_number, :string
      add :hour, :string
      add :store_owner, :string
      add :store, :string

      timestamps()
    end
  end
end
