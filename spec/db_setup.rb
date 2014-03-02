DBConfig = {
  adapter: "postgresql",
  database: "db2fog_test",
  username: "db2fog_tester",
  password: ""
}

DBQueries = {

  init: "CREATE ROLE #{DBConfig[:username]} LOGIN PASSWORD '#{DBConfig[:password]}';

    ALTER USER #{DBConfig[:username]} CREATEDB;",

  create: "CREATE DATABASE #{DBConfig[:database]};
    GRANT ALL PRIVILEGES ON #{DBConfig[:database]} TO #{DBConfig[:username]};",

  reset: "DROP TABLE IF EXISTS people;
    CREATE TABLE people (name VARCHAR(255) NULL);"
}

def run_query_system(sql)
  `echo "#{sql}" | #{psql_system}`
end

def run_query_user(sql)
  `echo "#{sql}" | #{psql_user}`
end

def psql_system
  "psql -d template1"
end

def psql_user
  "psql -d #{DBConfig[:database]} -U #{DBConfig[:username]}"
end