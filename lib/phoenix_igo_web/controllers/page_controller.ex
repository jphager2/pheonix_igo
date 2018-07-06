alias Igo.GoKifu

defmodule PhoenixIgoWeb.PageController do
  use PhoenixIgoWeb, :controller

  def index(conn, _params) do
    games = GoKifu.get_games()

    conn
    |> assign(:gokifu_games, games)
    |> render("index.html")
  end
end
