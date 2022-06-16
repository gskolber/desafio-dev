defmodule Odin.Guardian do
  use Guardian, otp_app: :odin

  alias Odin.User

  def subject_for_token(resource, _claims), do: {:ok, to_string(resource.id)}
  def resource_from_claims(claims) do
    User.get_user(claims["sub"])
  end
end
