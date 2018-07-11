defmodule PhoenixIgo.Igo do
  alias PhoenixIgo.{Game, Repo}

  def play!(game, coord) do
    igame = Game.to_igo(game)
    color = Igo.Game.turn(igame)

    case place_stone(igame, color, coord) do
      {:error, message} ->
        {:error, message}

      {:ok, igame} ->
        data = Game.serialize_data(igame)
        changeset = Ecto.Changeset.cast(game, %{"data" => data}, [:data])
        Repo.update(changeset)
        Repo.get(Game, game.id)
    end
  end

  defp place_stone(igame, color, coord) do
    cond do
      Igo.Rules.play_on_stone?(igame, coord) ->
        {:error, "You can't play on top of a stone!"}

      Igo.Rules.ko?(igame, coord, color) ->
        {:error, "You can't play the ko!"}

      true ->
        igame = Igo.Game.play(igame, color, coord)

        if Igo.Rules.suicide?(igame, coord) do
          {:error, "You can't play a suicide move!"}
        else
          {:ok, igame}
        end
    end
  end
end
