defmodule Sismed2.Repo do
  use Ecto.Repo,
    otp_app: :sismed2,
    adapter: Ecto.Adapters.Postgres
end
