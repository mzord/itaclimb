defmodule Itaclimb.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :body, :string
    field :slug, :string
    field :views, :integer
    field :published_at, :utc_datetime

    # Virtual
    field :reading_time, :integer, virtual: true

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :slug, :views, :published_at])
    |> validate_required([:title, :body, :slug])
    |> unique_constraint(:slug)
    |> compute_reading_time()
  end

  defp compute_reading_time(changeset) do
    case get_change(changeset, :body) do
      nil ->
        changeset

      body ->
        word_count = body |> String.split() |> Enum.count()
        minutes = max(1, round(word_count / 200))

        put_change(changeset, :reading_time, minutes)
    end

  end

end
