#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require_relative "lib/environment"

Environment.load

if ActiveRecord::Base.connection.tables.empty?
  puts "[ALERT] Please run `rake db:setup` to set up the database"
  exit
end
