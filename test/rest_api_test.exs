# defmodule RestApiTest do
#   use ExUnit.Case

#   test "the truth" do
#     assert 1 + 1 == 2
#   end
# end
defmodule RestApiTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts RestApi.init([])

  test "returns hello world" do
    # Create a test connection
    conn = conn(:get, "/")
    conn = RestApi.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "Hello world"
  end

  test "returns ops" do
  	conn = conn(:get, "/bla")
  	conn = RestApi.call(conn, @opts)

  	assert conn.state == :sent
  	assert conn.status == 404
  	assert conn.resp_body == "OPS!"
  end
end