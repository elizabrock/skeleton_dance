require 'active_record'
require 'yaml'
Dir["./models/*.rb"].each { |f| require f }

class Environment
  CONFIG = YAML::load(File.open('config/database.yml'))

  def self.current
    env = (ENV["ENV"] || "").downcase
    if CONFIG.has_key?(env)
      env
    else
      "development"
    end
  end

  def self.load
    connection_details = CONFIG[Environment.current]
    ActiveRecord::Base.establish_connection(connection_details)
  end
end
