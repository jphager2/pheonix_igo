alias Igo.{Game, Board}

defmodule PhoenixIgoWeb.GameView do
  use PhoenixIgoWeb, :view

  def board_size(game) do
    round(:math.sqrt(length(game.board)))
  end

  def board_rows(game) do
    Enum.chunk_every(game.board, board_size(game))
  end

  def stone_color_class(stone) do
    cond do
      stone == :black ->
        "stone black"

      stone == :white ->
        "stone white"

      true ->
        "liberty"
    end
  end
end
