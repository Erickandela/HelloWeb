defmodule HelloWeb.OurAuth.Plug do
import Plug.Conn
  def init(opts), do: opts
  def call(conn, opts)do
    conn
    |> HelloWeb.OurAuth.Router.call(opts)
  end
end
