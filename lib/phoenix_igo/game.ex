alias PhoenixIgo.Repo

defmodule PhoenixIgo.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :data, :map
    field :result, :string
    has_many :players, PhoenixIgo.GamePlayer

    timestamps()
  end

  def play!(game, coord) do
    igame = to_igo(game)
    color = Igo.Game.turn(igame)
    igame = Igo.Game.play(igame, color, coord)
    data = serialize_data(igame)
    # TODO: Add handleing of rules (play! probably shouldn't be in this
    # module.
    changeset = Ecto.Changeset.cast(game, %{"data" => data}, [:data])
    Repo.update(changeset)
  end

  def deserialize_player(player) do
    %{
      captures: player["captures"],
      name: player["name"]
    }
  end

  def deserialize_moves(moves) do
    Enum.map(moves, fn(move) -> 
      deserialized = %{
        color: String.to_atom(move["color"]),
        captures: move["captures"],
        board: deserialize_board(move["board"]),
      }

      deserialized = if Map.has_key?(move, "coord") do
        [y, x] = move["coord"]
        Map.put(deserialized, :coord, {y, x})
      else
        deserialized
      end

      if Map.has_key?(move, "pass") do
        move.put(deserialized, :pass, move["pass"])
      else
        deserialized
      end
    end)
  end

  def deserialize_board(board) do
    Enum.map(board, fn(stone) -> String.to_atom(stone) end)
  end

  def deserialize_data(serialized) do
    %{
      black: deserialize_player(serialized["black"]),
      white: deserialize_player(serialized["white"]),
      moves: deserialize_moves(serialized["moves"]),
      board: deserialize_board(serialized["board"]),
      passes: serialized["passes"]
    }
  end

  def serialize_moves(moves) do
    Enum.map(moves, fn(move) ->
      if move[:coord] do
        Map.update!(move, :coord, fn({y, x}) -> [y, x] end)
      else
        move
      end
    end)
  end

  def serialize_data(deserialized) do
    Map.update(deserialized, :moves, [], fn(moves) ->
      serialize_moves(deserialized[:moves])
    end)
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
