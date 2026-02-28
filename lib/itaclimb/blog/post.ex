defmodule Itaclimb.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    field :slug, :string
    field :published_at, :utc_datetime
    field :views, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :slug, :published_at, :views])
    |> validate_required([:title, :body, :slug, :published_at, :views])
    |> unique_constraint(:slug)
  end
end
