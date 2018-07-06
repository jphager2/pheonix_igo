defmodule PhoenixIgo.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :data, :map
      add :player_black, :string
      add :player_white, :string
      add :result, :string

      timestamps()
    end

  end
end
