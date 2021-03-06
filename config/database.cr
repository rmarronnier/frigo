database_name = "frigo_#{Lucky::Env.name}"
# database_name = "jxtqrstt"

AppDatabase.configure do |settings|
  if Lucky::Env.production?
    settings.credentials = Avram::Credentials.parse(ENV["DB_URL"])
  else
    settings.credentials = Avram::Credentials.parse?(ENV["DB_URL"]?) || Avram::Credentials.new(
      database: database_name,
      hostname: ENV["DB_HOST"]? || "rogue.db.elephantsql.com",
      port: ENV["DB_PORT"]?.try(&.to_i) || 5432,
      # Some common usernames are "postgres", "root", or your system username (run 'whoami')
      username: ENV["DB_USERNAME"]? || "jxtqrstt",
      # Some Postgres installations require no password. Use "" if that is the case.
      password: ENV["DB_PASSWORD"]? || "vI09Ltna5hdrw1IzRQe7cbgYNTkuVFf7"
    )
  end
end

Avram.configure do |settings|
  settings.database_to_migrate = AppDatabase

  # In production, allow lazy loading (N+1).
  # In development and test, raise an error if you forget to preload associations
  settings.lazy_load_enabled = Lucky::Env.production?
end
