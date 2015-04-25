defmodule AppRouter do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hello world")
  end

  get "/hello" do
    send_resp(conn, 200, Poison.Encoder.encode(:ok, []))
  end

  match _ do
    send_resp(conn, 404, "OPS!")
  end
end