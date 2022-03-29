use Mix.Config

config :mastery_persistence,
       MasteryPersistence.Repo,
       database: "mastery_test",
       hostname: "localhost",
       pool: Ecto.Adapters.SQL.Sandbox,
       show_sensitive_data_on_connection_error: true,
       username: "postgres",
       password: "postgres"
