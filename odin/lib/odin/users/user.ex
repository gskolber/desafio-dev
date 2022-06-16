defmodule Odin.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: :true

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> change(Bcrypt.add_hash(attrs.password))
  end
end
