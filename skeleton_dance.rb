#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require_relative "lib/environment"

Environment.load

if ActiveRecord::Base.connection.tables.empty?
  puts "[ALERT] Please run `rake db:setup` to set up the database"
  exit
elsif Bone.count == 0
  puts "[ALERT] Please run `rake db:setup` to populate the database"
  exit
end

Bone.all.each do |bone|
  puts "The #{bone.name} Bone is connected to nothing"
end
