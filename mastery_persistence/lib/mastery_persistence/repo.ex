defmodule MasteryPersistence.Repo do
  @moduledoc false

  use Ecto.Repo,
    otp_app: :mastery_persistence,
    adapter: Ecto.Adapters.Postgres
end
