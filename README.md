# The Skeleton Dance

This is the project for Head First Rails Development, Chapter 2.

## Features

* `./skeleton_dance` prints out the skeleton dance, using ActiveRecord to access a SQLite database.
* `rake db:setup` creates and populates the SQLite database.

## Requirements

* `./skeleton_dance` should print out a message prompting the user to run `bundle` if the necessary gems aren't present
* `./skeleton_dance` should print out a message suggesting the user run `rake db:setup` if there is no database/no records in the database
* Running `rake db:setup` should create the database and populate it with records from `db/seeds.rb`
* Running `rake db:setup` should remove any data already present if the database already exists, before it populates the database with new data
* Running `./skeleton_dance` will print out the Skeleton Dance, using the data from database

## Proposed Schema

    bones
    -----
    id: integer PK
    name: string

    connections
    -----
    first_bone_id: integer FK
    second_bone_id: integer FK
