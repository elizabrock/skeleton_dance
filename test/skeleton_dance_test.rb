require "minitest/autorun"
require_relative "test_helper"

class SkeletonDanceTest < Minitest::Test
  # This is a stepping-stone feature, working up to actually printing out the
  # whole song, and will eventually be removed.
  def test_all_bones_are_printed_out
    Bone.create(name: "Leg")
    Bone.create(name: "Foot")
    Bone.create(name: "Ankle")
    expected_output = "The Leg Bone is connected to nothing\nThe Foot Bone is connected to nothing\nThe Ankle Bone is connected to nothing\n"
    shell_output = ""
    IO.popen('ENV=TEST ./skeleton_dance.rb') do |pipe|
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end
end
