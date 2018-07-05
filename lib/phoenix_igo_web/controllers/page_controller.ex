defmodule PhoenixIgoWeb.PageController do
  use PhoenixIgoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
