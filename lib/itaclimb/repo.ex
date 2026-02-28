defmodule Itaclimb.Repo do
  use Ecto.Repo,
    otp_app: :itaclimb,
    adapter: Ecto.Adapters.Postgres
end
