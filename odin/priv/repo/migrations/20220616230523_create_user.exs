defmodule Odin.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :email, :string
      add :hash_password, :string

      timestamps()
    end
  end
end
