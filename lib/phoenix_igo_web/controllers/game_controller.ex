alias PhoenixIgo.{Repo, Player}
# alias Igo.GoKifu

defmodule PhoenixIgoWeb.GameController do
  use PhoenixIgoWeb, :controller

  def show(conn, %{"id" => id}) do
    # game = Repo.get(Game, id)
    game = Igo.Game.new(19)
    game = Igo.Game.update_player(game, :black, "jphager2")
    game = Igo.Game.update_player(game, :white, "sai(#{id})")

    conn
    |> assign(:game, game)
    |> render("show.html")
  end
end

