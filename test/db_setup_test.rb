require "minitest/autorun"
require_relative "test_helper"

class TestDbSetup < Minitest::Test
  def test_user_is_prompted_to_run_db_setup_if_no_database
    # This test doesn't apply in SQLite.  The database is created as soon as we
    # attempt to access it.
  end

  def test_user_is_prompted_to_run_db_setup_if_no_tables
    test2_db_file = "db/test2.sqlite"
    File.delete(test2_db_file) if File.exists?(test2_db_file)
    expected_output = "[ALERT] Please run `rake db:setup` to set up the database\n"
    shell_output = ""
    # This database should already exist, because it is the test database:
    IO.popen('ENV=TEST2 ./skeleton_dance.rb') do |pipe|
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_user_is_prompted_to_run_db_setup_if_no_data
    assert_equal 0, Bone.count
    # TODO: assert_equal 0, Connection.count
    expected_output = "[ALERT] Please run `rake db:setup` to populate the database\n"
    shell_output = ""
    # This database should already exist, because it is the test database:
    IO.popen('ENV=TEST ./skeleton_dance.rb') do |pipe|
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_db_seed_runs_without_error
    assert_equal 0, Bone.count
    # TODO: assert_equal 0, Connection.count
    require_relative "../lib/migrations.rb"
    Rake::Task['db:seed'].invoke
    assert_equal 5, Bone.count
    # TODO: assert_equal 5, Connection.count
  end
end
