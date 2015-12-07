require "minitest/autorun"
require_relative "test_helper"

class TestDbSetup < Minitest::Test
  def test_user_is_prompted_to_run_db_setup_if_no_database
    # This test doesn't apply in SQLite.  The database is created as soon as we
    # attempt to access it.
  end

  def test_user_is_prompted_to_run_db_setup_if_no_tables
    shell_output = ""
    expected_output = ""
    test2_db_file = "db/test2.sqlite"
    File.delete(test2_db_file) if File.exists?(test2_db_file)
    # This database should already exist, because it is the test database:
    IO.popen('ENV=TEST2 ./skeleton_dance.rb') do |pipe|
      expected_output = "[ALERT] Please run `rake db:setup` to set up the database\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_user_is_prompted_to_run_db_setup_if_no_data
    skip "we can't test this until there are tables"
    shell_output = ""
    expected_output = ""
    # This database should already exist, because it is the test database:
    IO.popen('ENV=TEST ./skeleton_dance.rb') do |pipe|
      expected_output = "[ALERT] Please run `rake db:setup` to populate the database\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_db_seed_runs_without_error
    require_relative "../lib/migrations.rb"
    Rake::Task['db:seed'].invoke
    skip "We can't test the data is loaded yet"
  end
end
