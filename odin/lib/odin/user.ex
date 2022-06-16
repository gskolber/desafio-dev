defmodule Odin.User do

  alias Odin.Users.User, as: UserSchema

  def create_user(user_attrs) do
    user_attrs
    |> UserSchema.changeset()
    |> Repo.insert()
  end

end
