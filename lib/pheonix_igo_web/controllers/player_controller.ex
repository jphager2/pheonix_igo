alias PheonixIgo.{Repo, Player}

defmodule PheonixIgoWeb.PlayerController do
  use PheonixIgoWeb, :controller

  def index(conn, _params) do
    players = Repo.all(Player)

    conn
    |> assign(:players, players)
    |> render("index.html")
  end
end

