$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'bundler'
Bundler.require
require 'rexml/document'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

ActiveRecord::Migration.verbose = false
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

RSpec.configure do |config|
  config.before(:all) do
    create_database
  end

  config.after(:all) do
    drop_database
  end

  config.extend Rails3::Execute
end

def create_database
  ActiveRecord::Schema.define(:version => 1) do
    create_table :models do |t|
      t.string :xml
      t.string :xml_helper
    end
  end
end

def drop_database
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end
