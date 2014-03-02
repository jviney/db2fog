DBConfig = {
  adapter: "postgresql",
  database: "db2fog_test",
  username: "db2fog_tester",
  password: ""
}

DBQueries = {
  init: "CREATE ROLE #{DBConfig[:username]} LOGIN PASSWORD '#{DBConfig[:password]}';
    ALTER USER #{DBConfig[:username]} CREATEDB;
    CREATE DATABASE #{DBConfig[:database]};
    GRANT ALL PRIVILEGES ON DATABASE #{DBConfig[:database]} TO #{DBConfig[:username]};",

  reset: "DROP TABLE IF EXISTS people;
    CREATE TABLE people (name VARCHAR(255) NULL);"
}

def system_query(sql)
  `echo "#{sql}" | #{psql_system}`
end

def user_query(sql)
  `echo "#{sql}" | #{psql_user}`
end

def psql_system
  "psql -d template1"
end

def psql_user
  "psql -d #{DBConfig[:database]} -U #{DBConfig[:username]}"
end
