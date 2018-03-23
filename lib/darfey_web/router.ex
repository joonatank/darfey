defmodule DarfeyWeb.Router do
  use DarfeyWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # We get CSRF exceptions if we use this in POST messages
    # should fix, but not a priority
    #plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DarfeyWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PostController, :index
    get "/media", MediaController, :index
    get "/blog", PostController, :index
    # For testing the author_index without authentication
    get "/auth", PostController, :author_index
    get "/sql", SqlController, :index
    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", DarfeyWeb do
  #   pipe_through :api
  # end
end
