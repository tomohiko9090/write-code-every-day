# 1.問題
# https://qiita.com/drken/items/fd4e5e3630d0f5859067#%E7%AC%AC-5-%E5%95%8F--abc-083-b---some-sums-200-%E7%82%B9

# 2.ライブラリ導入
require 'minitest/autorun'
require 'pry'

# 3.テストコード
class Test < Minitest::Test
  def test_1
    result = some_sums(20, 2, 5)
    assert_equal 84, result
  end

  def test_2
    result = some_sums(10, 1, 2)
    assert_equal 13, result
  end
end

# 4.回答コード
def some_sums(n, a, b)
  count = 0
  (1..n).each do |i|
    order = i.to_s.size

    if order == 1
      if a <= i && i <= b
        count += i
      end
    end

    if order == 2
      split_sum = i.to_s.split("").map(&:to_i).sum

      if a <= split_sum && split_sum <= b
        count += i
      end
    end
  end

  count
end
