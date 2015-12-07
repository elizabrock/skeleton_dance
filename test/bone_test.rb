require "minitest/autorun"
require_relative "test_helper"

class BoneTest < Minitest::Test
  # I would normally use the Ruby gem "shoulda" to simplify the model tests,
  # however I want to minimize the number of dependencies in this project.

  def test_duplicate_bones_arent_allowed
    Bone.create(name: "Ankle Bone")
    new_bone = Bone.new(name: "Ankle Bone")
    new_bone.save
    assert_equal ["has already been taken"], new_bone.errors[:name]
    assert new_bone.new_record?
  end

  def test_duplicate_bones_arent_allowed
    bone = Bone.new(name: "")
    bone.save
    assert_equal ["can't be blank"], bone.errors[:name]
    assert bone.new_record?
  end
end

