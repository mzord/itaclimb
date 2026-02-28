defmodule Itaclimb.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :text
      add :slug, :string
      add :published_at, :utc_datetime
      add :views, :integer

      timestamps(type: :utc_datetime)
    end

    create unique_index(:posts, [:slug])
  end
end
