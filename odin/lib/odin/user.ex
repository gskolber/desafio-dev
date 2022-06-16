defmodule Odin.User do
  alias Odin.Users.User, as: UserSchema
  alias Odin.Repo
  alias Odin.Guardian

  def create_user(user_attrs) do
    user_attrs
    |> UserSchema.changeset()
    |> Repo.insert()
  end

  def get_user(id), do: Repo.get(UserSchema, id)

  def login(email, password) do
    user = Repo.get_by(UserSchema, %{email: email})

    with {:ok, token, _} <- check_pass(user, password) do
      %{
        token: token
      }
    end
  end

  def check_pass(user, password) do
    case Bcrypt.check_pass(user, password) do
      {:error, _} -> {:error, "an error was ocurred"}
      {:ok, user} -> Guardian.encode_and_sign(user)
    end
  end
end
