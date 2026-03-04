defmodule ItaclimbWeb.HeaderComponents do
  use ItaclimbWeb, :html
  use Phoenix.Component


  def main_header(assigns) do
    ~H"""
    <header class="bg-[#111111] border-b border-gray-800 sticky top-0 z-50">
      <nav class="container mx-auto px-4 py-3 flex items-center justify-between">

        <a href={~p"/"} class="flex items-center gap-3 group">
          <div class="flex items-center justify-center">
            <img class="h-9 w-auto object-contain transition-transform group-hover:scale-110" src={~p"/images/newlogo_nobg.png"} />
          </div>
          <span class="text-2xl font-bold tracking-tighter text-white font-mono uppercase">
            Ita<span class="text-[#CC9933]">Climb</span>
          </span>
        </a>

        <div class="hidden md:flex items-center gap-8">
          <ul class="flex gap-6 text-xs font-bold uppercase tracking-widest text-gray-300">
            <li><a href={~p"/vias"} class="hover:text-[#CC9933] transition-colors">Vias</a></li>
            <li><a href={~p"/posts"} class="hover:text-[#CC9933] transition-colors">Notícias</a></li>
            <li><a href="#" class="hover:text-[#CC9933] transition-colors">Comunidade</a></li>
            <li><a href="#" class="hover:text-[#CC9933] transition-colors">Sobre</a></li>
          </ul>
          <button class="bg-[#CC9933] text-[#111111] px-4 py-1.5 rounded text-xs font-black uppercase hover:bg-yellow-600 transition-all">
            Entrar
          </button>
        </div>

        <div class="md:hidden">
          <button id="mobile-menu-button" class="text-[#CC9933] p-2 focus:outline-none">
            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
            </svg>
          </button>
        </div>
      </nav>

      <div id="mobile-menu" phx-hook="menuClick" class="hidden md:hidden bg-[#1a1a1a] border-t border-gray-800">
        <div class="flex flex-col p-4 gap-4 text-sm font-bold uppercase tracking-widest">
          <a href="#" class="text-white hover:text-[#CC9933] py-2 border-b border-gray-800">Vias</a>
          <a href="#" class="text-white hover:text-[#CC9933] py-2 border-b border-gray-800">Notícias</a>
          <a href="#" class="text-white hover:text-[#CC9933] py-2 border-b border-gray-800">Comunidade</a>
          <a href="#" class="text-white hover:text-[#CC9933] py-2">Sobre</a>
          <button class="bg-[#CC9933] text-[#111111] w-full py-3 rounded font-black">ENTRAR</button>
        </div>
      </div>
    </header>
    """
  end
end
