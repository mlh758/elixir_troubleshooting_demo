defmodule MisbehaveWeb.StatusController do
  use MisbehaveWeb, :controller

  def index(conn, _params) do
    conn
    |> put_resp_content_type("application/json")
    |> json(%{status: "I'm alive!"})
  end
end
