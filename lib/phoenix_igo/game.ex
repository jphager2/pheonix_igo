alias PhoenixIgo.Repo

defmodule PhoenixIgo.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :data, :string
    field :result, :string
    has_many :players, PhoenixIgo.GamePlayer

    timestamps()
  end

  def play!(game, coord) do
    igame = to_igo(game)
    color = Igo.Game.turn(igame)
    igame = Igo.Game.play(igame, color, coord)
    data = serialize_data(igame)
    # TODO: Add handleing of rules (play! probably shouldn't be in this module)
    changeset = Ecto.Changeset.cast(game, %{"data" => data}, [:data])
    Repo.update(changeset)
  end

  def deserialize_data(serialized) do
    :erlang.binary_to_term(serialized)
  end

  def serialize_data(deserialized) do
    :erlang.term_to_binary(deserialized)
  end

  def to_igo(game) do
    deserialize_data(game.data)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:data, :result])
    |> validate_required([:data, :result])
  end
end
