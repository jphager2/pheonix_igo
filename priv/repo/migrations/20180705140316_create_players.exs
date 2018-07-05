defmodule PhoenixIgo.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :email, :string
      add :rating, :integer
      add :rank, :string

      timestamps()
    end

  end
end
