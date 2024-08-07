# 1.問題
# https://qiita.com/drken/items/fd4e5e3630d0f5859067#%E7%AC%AC-3-%E5%95%8F--abc-081-b---shift-only-200-%E7%82%B9

# 2.ライブラリ導入
require 'minitest/autorun'
require 'pry'

# 3.テストコード
class TestBlackboard < Minitest::Test
  def test_even_numbers
    result = blackboard([16, 8, 4])
    assert_equal [2, [4, 2, 1]], result
  end

  def test_contains_odd_number
    result = blackboard([8, 3, 2])
    assert_equal [0, [8, 3, 2]], result
  end

  def test_mixed_list
    result = blackboard([16, 8, 4, 2])
    assert_equal [1, [8, 4, 2, 1]], result
  end
end

# 4.回答コード
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
