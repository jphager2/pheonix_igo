defmodule PheonixIgoWeb.Router do
  use PheonixIgoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PheonixIgoWeb do
    pipe_through :browser # Use the default browser stack

    # get "/", PageController, :index

    get "/", PlayerController, :index
    get "/players", PlayerController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PheonixIgoWeb do
  #   pipe_through :api
  # end
end
