require 'minitest/autorun'

class Tested
  
end

class ConditionTest < MiniTest::Test
  def setup
    @value = [1, 'xyz']
  end

  def test_odd
    assert_raises(Error)
  end
end