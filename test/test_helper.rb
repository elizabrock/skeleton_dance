ENV["ENV"] = "test"
require_relative "../lib/environment"

class Minitest::Test
  def setup
    Environment.load
    Bone.destroy_all
  end
end
