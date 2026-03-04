defmodule Itaclimb.Blog do
  @moduledoc """
  The Blog context.
  """

  import Ecto.Query, warn: false
  alias Itaclimb.Repo

  alias Itaclimb.Blog.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Post
    |> Repo.all()
    |> Enum.map(&calculate_reading_time/1)
  end


   @doc """
  Returns the list of the first three posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_first_three_posts(limit \\ 3) do
    Post
    |> order_by(desc: :inserted_at)
    |> limit(^limit)
    |> Repo.all()
    |> Enum.map(&calculate_reading_time/1)
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id) do
    Post
    |> Repo.get!(id)
    |> calculate_reading_time()
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end

  @doc """
    Increments Post view.
  """
  def increment_post_views(%Post{} = post) do
    from(p in Post, where: p.id == ^post.id)
    |> Repo.update_all(inc: [views: 1])

    %{post | views: post.views + 1}
  end

  defp calculate_reading_time(post) do
    words_per_minute = 200
    word_count = post.body |> String.split() |> Enum.count()
    minutes = max(1, round(word_count / words_per_minute))

    # Aqui a "mágica": colocamos o valor no campo virtual da struct
    %{post | reading_time: minutes}
  end

end
