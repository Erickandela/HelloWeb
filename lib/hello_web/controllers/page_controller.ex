defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, params) do
     render(conn, "index.text", message: params["message"])
  end
end
