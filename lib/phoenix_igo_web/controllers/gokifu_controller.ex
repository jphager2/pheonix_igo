defmodule PhoenixIgoWeb.GoKifuController do
  use PhoenixIgoWeb, :controller

  alias Igo.{GoKifu, SgfReader}
  alias PhoenixIgo.{Repo, Game, Igo}

  def create(conn, params = %{"game" => %{"url" => url}}) do
    game = {nil, nil, nil, nil, url}
    file = GoKifu.download_path(game, "/tmp") 
    GoKifu.download_game(game, "/tmp")
    reader = SgfReader.new(file)
    reader = SgfReader.seek(reader, 999)
    
    igame = reader.game

    case Repo.insert(%Game{data: Game.serialize_data(igame), result: reader.result}) do
      {:ok, game} ->
        conn |> redirect(to: "/games/#{game.id}") |> halt()

      _ ->
        conn
        |> put_flash(:alert, "Failed to download game")
        |> redirect(to: "/")
        |> halt()
    end
  end
end
