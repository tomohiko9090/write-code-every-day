# blackboard_with_minitest.rb

require 'minitest/autorun'

def blackboard(num_list)
  n = 0
  flag = false

  while flag == false
    num = []
    num_list.each do |a|
      if a % 2 == 0
        num << (a / 2)
      else
        flag = true
        break
      end
    end

    if num.length == num_list.length
      num_list = num
      n += 1
    end
  end

  [n, num_list]
end

class TestBlackboard < Minitest::Test
  def test_even_numbers
    result = blackboard([8, 4, 2])
    assert_equal [2, [2, 1, 1]], result
  end

  def test_contains_odd_number
    result = blackboard([8, 3, 2])
    assert_equal [0, [8, 3, 2]], result
  end

  def test_empty_list
    result = blackboard([])
    assert_equal [0, []], result
  end

  def test_mixed_list
    result = blackboard([16, 8, 4, 2])
    assert_equal [3, [2, 1, 1, 1]], result
  end
end
