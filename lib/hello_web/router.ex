# defmodule HelloWeb.Plugs.Locale do
#   import Plug.Conn
#
#   @locales ["en", "fr", "de"]
#
#   def init (default), do: default
#
#   def call (%Plug.Con{params: %{"locale" => loc}} = conn, _default) when loc in @locales do
#     assign (conn, :locale, loc)
#   end
#
#   def call (conn, default), do: assign (conn, :locale, default)
# end

defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "text", "xml"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # plug OurAuth
    # plug :put_user_token
  end

# resources "/users", UserController do
#   resources "/post", PostController
# end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloWeb do
    pipe_through :browser

    #foward
    #pipe_through [:authenticate_user, :ensure_admin]
    #forward "/jobs", BackgroundJob.Plug, name: "Hello Phoenix"


    get "/", PageController, :index
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete],
    singleton: true
    resources "/posts", PostController
    # get "/", PageController, :show
    # get "/our_path/:id", HelloController, :show
    #resources "/reviews", ReviewController
    #Messenger
    #get "/hello", HelloController, :index
    #get "/hello/:messenger", HelloController, :show

    #Routing
    #def match(:get, "/", PageController, :index, [])
    #get "/", RootController, :index

    #Resources / verbs / Paths / Controller Actions
    #resources "/users", UserController

    #Selective Routes only: except:
    #resources "/post", PostController, only: [:index, :show]

    #comments resources
    #resources "/comments", CommentController, except: [:delete]
  end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, Hello.Accounts.get_user!(user_id))
      end
  end

 scope "/cms", HelloWeb.CMS, as: :cms do
    pipe_through [:browser, :authenticate_user]

    resources "/pages", PageController
  end
  #Scopes
  # New Route for redirects
  # scope "/", HelloWeb do
  #   pipe_through :browser
  #   get "/redirect_test", PageController, :redirect_test, as: :redirect_test
  # end

  # scope "/", HelloWeb do
  #   pipe_through :browser
  #
  #     resources "/users", UserController
  # end
  #
  # scope "/", AnotherApp do
  #   pipe_through :browser
  #
  #   resources "/post", PostController
  # end

  # Other scopes may use custom stacks.
  # scope "/api", HelloWeb do
  #   pipe_through :api
  #end
  #foward
  #forward "/jobs", BackgroundJob.Plug
end
