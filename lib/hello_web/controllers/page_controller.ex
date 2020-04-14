defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def test(conn, _params)do
  render(conn, "test.html")
end
end
