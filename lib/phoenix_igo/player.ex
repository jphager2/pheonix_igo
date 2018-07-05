defmodule PhoenixIgo.Player do
  use Ecto.Schema
  import Ecto.Changeset


  schema "players" do
    field :email, :string
    field :name, :string
    field :rank, :string
    field :rating, :integer

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :email, :rating, :rank])
    |> validate_required([:name, :email, :rating, :rank])
  end
end
