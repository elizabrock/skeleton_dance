require 'active_record_migrations'
require_relative 'environment'

ActiveRecordMigrations.configure do |c|
  c.environment = Environment.current
  c.yaml_config = 'config/database.yml'
end

ActiveRecordMigrations.load_tasks
