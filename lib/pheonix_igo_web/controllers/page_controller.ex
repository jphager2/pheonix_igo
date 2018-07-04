defmodule PheonixIgoWeb.PageController do
  use PheonixIgoWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
