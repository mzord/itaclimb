defmodule ItaclimbWeb.Helpers.ImageHelpers do
  def ik_url(path, opts \\ []) do
    endpoint = Application.get_env(:itaclimb, :imagekit)[:url_endpoint]

    # Exemplo de transformações: w-300,h-300,q-80
    tr = opts
         |> Enum.map(fn {k, v} -> "#{k}-#{v}" end)
         |> Enum.join(",")

    "#{endpoint}#{path}?tr=#{tr}"
  end
end
