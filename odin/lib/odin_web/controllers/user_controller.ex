defmodule OdinWeb.UserController do
  use OdinWeb, :controller

  alias Odin.Cnab

  def upload(conn, %{"document" => file_to_upload}) do
    {:ok, file} = File.read(file_to_upload.path)

    file = Cnab.save_cnab(file)

    conn
    |> put_status(201)
    |> json(%{
      "message" => "File uploaded #{file_to_upload.filename}"
    })
  end
end
