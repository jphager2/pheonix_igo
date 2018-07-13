defmodule PhoenixIgoWeb.GameController do
  use PhoenixIgoWeb, :controller

  alias PhoenixIgo.{Repo, Game, Igo}

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
    coord = {String.to_integer(y), String.to_integer(x)}

    if game do
      conn = case Igo.play!(game, coord) do
        {:error, message} ->
          conn
          |> put_flash(:error, message)

        _ -> conn
      end

      conn
      |> redirect(to: "/games/#{game.id}")
      |> halt()
    else
      conn |> redirect(to: "/") |> halt()
    end
  end
end

