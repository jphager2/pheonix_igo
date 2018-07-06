defmodule PhoenixIgo.Game do
  use Ecto.Schema
  import Ecto.Changeset


  schema "games" do
    field :data, :map
    field :player_black, :string
    field :player_white, :string
    field :result, :string

    timestamps()
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:data, :player_black, :player_white, :result])
    |> validate_required([:data, :player_black, :player_white, :result])
  end
end
