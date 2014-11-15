defmodule RestApi do

  def init(options) do
    options
  end

  def call(conn, _opts) do
    AppRouter.call(conn, AppRouter.init([]))
  end
end

IO.puts "Running RestApi with Cowboy on http://localhost:4000"
Plug.Adapters.Cowboy.http RestApi, []