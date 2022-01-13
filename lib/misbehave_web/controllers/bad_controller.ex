defmodule MisbehaveWeb.BadController do
  use MisbehaveWeb, :controller
  import Misbehave.Math, only: [sum_to: 1]

  def index(conn, %{"count" => count}) do
    {val, ""} = Integer.parse(count)
    sum = sum_to(val)
    conn
      |> put_resp_content_type("application/json")
      |> json(%{sum: sum})
  end

  def index(conn, _params) do
    conn
      |> put_resp_content_type("text/plain")
      |> send_resp(200, "send the count query param and I'll sum 1..n")
  end
end
