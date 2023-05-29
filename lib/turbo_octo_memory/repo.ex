defmodule TurboOctoMemory.Repo do
  use Ecto.Repo,
    otp_app: :turbo_octo_memory,
    adapter: Ecto.Adapters.Postgres
end
