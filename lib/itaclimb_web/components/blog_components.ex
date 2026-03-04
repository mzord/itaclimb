defmodule ItaclimbWeb.BlogComponents do
  use Phoenix.Component

  alias Itaclimb.Blog.Post

  attr :post, :any, required: true
  def reading_time(assigns) do
    ~H"""
      <span class="flex items-center gap-1">
        <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
        <%= @post.reading_time %> minuto
      </span>
    """
  end

  attr :date, DateTime, required: true
  attr :id, :string, required: true
  @spec local_time(map()) :: Phoenix.LiveView.Rendered.t()
  def local_time(assigns) do
    ~H"""
    <time
      id={"time-#{@id}"}
      datetime={DateTime.to_iso8601(@date)}
      class="local-time"
      phx-hook="LocalTime"
    >
      <%= @date %> </time>
    """
  end


  attr :posts, :list, required: true, doc: "A lista dos últimos três posts"

  def latest_posts(assigns) do
    ~H"""
    <section class="bg-[#111111] py-12 px-4">
      <div class="container mx-auto">
        <div class="flex justify-between items-end mb-8 border-b border-gray-800 pb-4">
          <div>
            <h2 class="text-[#CC9933] uppercase tracking-widest text-sm font-bold">Explorar</h2>
            <h3 class="text-white text-3xl font-bold font-mono">Notícias da Escalada</h3>
          </div>
          <a href="#" class="text-[#CC9933] hover:underline text-sm font-medium">Ver todas →</a>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

          <%= for post <- @posts do %>

          <article class="group cursor-pointer">
            <div class="relative overflow-hidden rounded-lg mb-4 aspect-video">
              <img src="https://images.unsplash.com/photo-1522163182402-834f871fd851?auto=format&fit=crop&q=80&w=800"
                  alt="Escalada na Serra dos Órgãos"
                  class="object-cover w-full h-full transition duration-500 group-hover:scale-105">
              <span class="absolute top-2 left-2 bg-[#CC9933] text-[#111111] text-[10px] font-bold px-2 py-1 rounded uppercase">Conquista</span>
            </div>
            <h4 class="text-white text-xl font-bold mb-2 group-hover:text-[#CC9933] transition-colors leading-tight">
              <%= post.title %>
            </h4>
            <p class="text-gray-400 text-sm line-clamp-2 mb-4">
             <%= post.body |> String.slice(0, 200) %>
            </p>
            <div class="flex items-center text-gray-500 text-xs gap-4">
              <span><.local_time date={post.inserted_at} id={post.id} /></span>
              <.reading_time post={post} />
            </div>
          </article>

          <% end %>

        </div>
      </div>
    </section>
    """
  end
end
