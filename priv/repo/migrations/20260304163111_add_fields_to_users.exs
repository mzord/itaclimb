defmodule Itaclimb.Repo.Migrations.AddFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :username, :string, null: false
      add :location, :string
      add :profile_picture_url, :string
    end

    create unique_index(:users, [:username]) # Garante que não existam usernames iguais
  end
end
