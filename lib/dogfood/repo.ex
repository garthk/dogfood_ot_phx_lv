defmodule Dogfood.Repo do
  use Ecto.Repo,
    otp_app: :dogfood,
    adapter: Ecto.Adapters.Postgres
end
