defmodule PhoenixIgo.GamePlayer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    belongs_to :player, PhoenixIgo.Player
    belongs_to :game, PhoenixIgo.Game
    field :color, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:player_id, :game_id, :color])
    |> validate_required([:player_id, :game_id, :color])
  end
end
