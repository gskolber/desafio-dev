defmodule Odin.Repo do
  use Ecto.Repo,
    otp_app: :odin,
    adapter: Ecto.Adapters.Postgres
end
