alias PhoenixIgo.{Repo, Game}

defmodule PhoenixIgoWeb.GameController do
  use PhoenixIgoWeb, :controller

  def show(conn, %{"id" => id}) do
    game = Repo.get(Game, id)

    if game do
      conn
      |> assign(:meta, game)
      |> assign(:game, Game.to_igo(game))
      |> render("show.html")
    else
      conn |> redirect(to: "/") |> halt()
    end
  end

  def play(conn, %{"id" => id,  "play" => %{"y" => y, "x" => x}}) do
    game = Repo.get(Game, id)

    if game do
      {status, _game} = Game.play!(game, {String.to_integer(y), String.to_integer(x)})

      conn
      |> put_flash(:notice, status)
      |> redirect(to: "/games/#{game.id}")
      |> halt()
    else
      conn |> redirect(to: "/") |> halt()
    end
  end
end

