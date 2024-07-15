# 1.問題
# https://qiita.com/drken/items/fd4e5e3630d0f5859067#%E7%AC%AC-6-%E5%95%8F--abc-088-b---card-game-for-two-200-%E7%82%B9

# 2.ライブラリ導入
require 'minitest/autorun'
require 'pry'

# 3.テストコード
class Test < Minitest::Test
  def test_1
    result = card([2,7,4])
    assert_equal 5, result
  end

  def test_2
    result = card([20,18,2,18])
    assert_equal 18, result
  end
end

# 4.回答コード
def card(array)
  array.sort!.reverse!

  alice = []
  bob = []

  while array != [] do
    alice << array.shift

    if array != []
      bob << array.shift
    end
  end

  alice.sum - bob.sum
end
