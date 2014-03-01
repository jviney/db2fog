DBConfig = {
  :adapter  => "postgresql",
  :database => 'db2fog_test',
  :user     => "test",
  :password => ""
}

DBQueries = {

  init_sql: "IF NOT EXISTS (
              SELECT *
              FROM   pg_catalog.pg_user
              WHERE  usename = '#{DBConfig[:user]}') THEN

              CREATE ROLE #{DBConfig[:user]} LOGIN PASSWORD '#{DBConfig[:password]}';
           END IF;",

  reset_schema: "DROP TABLE IF EXISTS people;
    CREATE TABLE people (name VARCHAR(255) NULL);
    GRANT ALL PRIVILEGES ON people TO #{DBConfig[:user]};",
}

def run_query_system(sql)
  `echo "#{sql}" | #{psql_system}`
end

def run_query_user(sql)
  `echo "#{sql}" | #{psql_user}`
end

def psql_system
  "psql template1"
end

def psql_user
  "psql -d #{DBConfig[:database]} -U #{DBConfig[:user]}"
end