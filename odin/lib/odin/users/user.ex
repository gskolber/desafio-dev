defmodule Odin.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :email, :string
    field :hash_password, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:email, :hash_password])
    |> validate_required([:email, :hash_password])
  end
end
