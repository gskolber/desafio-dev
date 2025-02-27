defmodule Odin.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :email, :string
      add :password_hash, :string

      timestamps()
    end
  end
end
