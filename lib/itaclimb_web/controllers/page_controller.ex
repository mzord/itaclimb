defmodule ItaclimbWeb.PageController do
  use ItaclimbWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
