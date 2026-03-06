defmodule Itaclimb.Repo.Migrations.AddImagekitFileIdToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :imagekit_file_id, :string
    end
  end
end
