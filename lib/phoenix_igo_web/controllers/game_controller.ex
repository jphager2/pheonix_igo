defmodule PhoenixIgoWeb.GameController do
  use PhoenixIgoWeb, :controller

  alias PhoenixIgo.{Repo, Game, Igo}

  plug :put_layout, "game.html"

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

  def review(conn, params) do
    game = Repo.get(Game, params["id"])

    move = try do
      String.to_integer(params["move"])
    rescue
      _ -> 0
    end

    if game do
      igame = Game.to_igo(game)

      move = cond do
        move < 0 ->
          0

        move > length(igame.moves) - 1 ->
          length(igame.moves) - 1

        true ->
          move
      end

      igame = Map.put(igame, :board, Enum.at(igame.moves, move).board)

      conn
      |> assign(:move, move)
      |> assign(:meta, game)
      |> assign(:game, igame)
      |> render("review.html")
    else
      conn |> redirect(to: "/") |> halt()
    end
  end
end

