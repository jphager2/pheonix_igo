alias PhoenixIgo.{Repo, Player}

defmodule PhoenixIgoWeb.PlayerController do
  use PhoenixIgoWeb, :controller

  def index(conn, _params) do
    players = Repo.all(Player)

    conn
    |> assign(:players, players)
    |> render("index.html")
  end
end

