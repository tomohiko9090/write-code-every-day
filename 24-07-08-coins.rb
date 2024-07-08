# 1.問題
# https://qiita.com/drken/items/fd4e5e3630d0f5859067#%E7%AC%AC-4-%E5%95%8F--abc-087-b---coins-200-%E7%82%B9

# 2.ライブラリ導入
require 'minitest/autorun'
require 'pry'

# 3.テストコード
class Test < Minitest::Test
  def test_1
    result = coins(2, 2, 2, 100)
    assert_equal 2, result
  end
end

# 4.回答コード
def coins(a, b, c, x)
  cnt = 0

  (a + 1).times do |i|
    (b + 1).times do |j|
      (c + 1).times do |k|
        if (500 * i) + (100 * j) + (50 * k) == x
          cnt += 1
        end
      end
    end
  end

  cnt
end
