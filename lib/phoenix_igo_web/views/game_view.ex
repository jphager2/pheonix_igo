alias Igo.{Game, Board}

defmodule PhoenixIgoWeb.GameView do
  use PhoenixIgoWeb, :view

  def game_title(game) do
    "#{game.black.name} vs. #{game.white.name}"
  end

  def game_turn(game) do
    Igo.Game.turn(game)
  end

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

  def star?(game, row, col) do
    Board.star?(board_size(game), { row, col })
  end
end
