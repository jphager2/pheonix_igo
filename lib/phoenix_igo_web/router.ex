defmodule PhoenixIgoWeb.Router do
  use PhoenixIgoWeb, :router

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

  scope "/", PhoenixIgoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/players", PlayerController, :index

    get "/games/:id", GameController, :show
    post "/games/:id/play", GameController, :play
    get "/games/:id/review", GameController, :review

    post "/gokifu", GoKifuController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixIgoWeb do
  #   pipe_through :api
  # end
end
