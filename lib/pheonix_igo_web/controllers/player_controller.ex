defmodule PheonixIgoWeb.PlayerController do
  use PheonixIgoWeb, :controller

  def index(conn, _params) do
    players = [
      %{
        id: "1",
        name: "jphager2",
        rank: "5k",
        created_at: "2018-07-04",
      }
    ]

    conn
    |> assign(:players, players)
    |> render("index.html")
  end
end

