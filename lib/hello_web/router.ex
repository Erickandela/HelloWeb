defmodule HelloWeb.Plugs.Locale do
  import Plug.Conn

  @locales ["en", "fr", "de"]

  def init (default), do: default

  def call (%Plug.Con{params: %{"locale" => loc}} = conn, _default) when loc in @locales do
    assign (conn, :locale, loc)
  end

  def call (conn, default), do: assign (conn, :locale, default)
end

defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
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

  #Scopes
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
