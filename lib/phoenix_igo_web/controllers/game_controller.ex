alias PhoenixIgo.{Repo, Game}

defmodule PhoenixIgoWeb.GameController do
  use PhoenixIgoWeb, :controller

  def show(conn, %{"id" => id}) do
    game = Repo.get(Game, id)

    if game do
      conn
      |> assign(:meta, game)
      |> assign(:game, game.data)
      |> render("show.html")
    else
      conn |> redirect(to: "/") |> halt()
    end
  end
end

