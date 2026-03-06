defmodule Itaclimb.ImageKit do
  @upload_url "https://upload.imagekit.io/api/v1/files/upload"
  @api_url "https://api.imagekit.io/v1/files"

  def upload(binary, filename) do
    config = Application.get_env(:itaclimb, :imagekit)
    auth = Base.encode64("#{config[:private_key]}:")

    body = [
      file: Base.encode64(binary),
      fileName: filename,
      useUniqueFileName: "true"
    ]

    case Req.post(@upload_url,
           form_multipart: body,
           headers: [{"authorization", "Basic #{auth}"}]
         ) do
      {:ok, %{status: 200, body: body}} ->
        {:ok, %{url: body["url"], file_id: body["fileId"]}}

      {:ok, %{body: body}} ->
        IO.inspect(body)
        {:error, body["message"]}

      {:error, _} ->
        {:error, "Connection failed"}
    end
  end

  def delete(nil), do: :ok

  def delete(file_id) when is_binary(file_id) do
    config = Application.get_env(:itaclimb, :imagekit)
    auth = Base.encode64("#{config[:private_key]}:")

    case Req.delete("#{@api_url}/#{file_id}",
           headers: [{"authorization", "Basic #{auth}"}]
         ) do
      {:ok, %{status: 204}} -> :ok
      {:ok, %{body: body}} -> {:error, body["message"]}
      {:error, _} -> {:error, "Connection failed"}
    end
  end
end
