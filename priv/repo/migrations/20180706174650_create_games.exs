defmodule PhoenixIgo.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :data, :text
      add :result, :string

      timestamps()
    end

    create table(:game_players) do
      add :player_id, references(:players)
      add :game_id, references(:games)
      add :color, :string

      timestamps()
    end

    create index("game_players", [:player_id])
    create index("game_players", [:game_id])
  end
end
