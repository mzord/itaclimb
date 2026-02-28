defmodule Itaclimb.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Itaclimb.Blog` context.
  """

  @doc """
  Generate a unique post slug.
  """
  def unique_post_slug, do: "some slug#{System.unique_integer([:positive])}"

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        body: "some body",
        published_at: ~U[2026-02-27 13:34:00Z],
        slug: unique_post_slug(),
        title: "some title",
        views: 42
      })
      |> Itaclimb.Blog.create_post()

    post
  end
end
