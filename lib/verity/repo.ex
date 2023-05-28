defmodule Verity.Repo do
  use Ecto.Repo,
    otp_app: :verity,
    adapter: Ecto.Adapters.Postgres
end
