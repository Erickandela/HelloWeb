  defmodule HelloWeb.HelloController do
    use HelloWeb, :controller

  #def index(conn, _params)do
  #render(conn, "index.html")
  # def show(conn, %{"messenger" => messenger})do
  #   render(conn, "show.html", messenger: messenger)
  # end

    def show(conn, %{"id" => id}) do
      # json(conn, %{id: id})
      html(conn, """
   <html>
     <head>
        <title>Passing an Id</title>
     </head>
     <body>
       <p>You sent in id #{id}</p>
     </body>
   </html>
  """)
end
end
