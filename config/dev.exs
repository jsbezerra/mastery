use Mix.Config

config :mastery_persistence,
       MasteryPersistence.Repo,
       database: "mastery_dev",
       hostname: "localhost",
       show_sensitive_data_on_connection_error: true,
       username: "postgres",
       password: "postgres"

config :mastery, :persistence_fn, &MasteryPersistence.record_response/2
