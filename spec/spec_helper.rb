require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'fileutils'
require 'timecop'
require 'active_record'
require 'db2fog'

require File.dirname(__FILE__) + '/db_setup.rb'

# run_query_system(DBQueries[:init_sql])

DB2Fog.config = {
  :provider   => 'Local',
  :local_root => File.dirname(__FILE__) + "/storage",
  :directory  => 'db2fog-test'
}

ActiveRecord::Base.configurations = { 'production' => DBConfig }
ActiveRecord::Base.establish_connection(:production)