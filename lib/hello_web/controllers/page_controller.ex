defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
    # redirect(conn, to: "/redirect_test")
    # redirect(conn, external: "https://elixir-lang.org/")
  end


end
