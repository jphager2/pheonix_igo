alias Igo.GoKifu

defmodule PhoenixIgoWeb.PageController do
  use PhoenixIgoWeb, :controller

  def index(conn, _params) do
    gokifu = try do
      GoKifu.get_games()
    rescue
      _ -> []
    end

    conn
    |> assign(:gokifu_games, gokifu)
    |> render("index.html")
  end
end
