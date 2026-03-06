defmodule ItaclimbWeb.HomeLive do
  use ItaclimbWeb, :live_view

  def mount(_params, _session, socket) do
    posts = Itaclimb.Blog.list_first_three_posts()
    IO.inspect(posts)
    {
      :ok,
      socket |> assign(posts: posts)
    }
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
      <div>
      <ItaclimbWeb.BlogComponents.latest_posts posts={@posts} />
      <img src={ItaclimbWeb.Helpers.ImageHelpers.ik_url("eu_na_barrinha.jpeg", w: 200, h: 200)} />
      </div>

    """
  end

end
