# 1.問題
# https://qiita.com/drken/items/fd4e5e3630d0f5859067#%E7%AC%AC-2-%E5%95%8F--abc-081-a---placing-marbles-100-%E7%82%B9

# 2.ライブラリ導入
require 'minitest/autorun'
require 'pry'

# 3.テストコード
require 'minitest/autorun'

class TestOneJadge < Minitest::Test
  def test_1
    result = one_jadge("110000101")
    assert_equal 4, result
  end

  def test_2
    result = one_jadge("1")
    assert_equal 0, result
  end

  def test_3
    result = one_jadge("")
    assert_equal 0, result
  end
end

# 4.回答コード
def one_jadge(s)
  n = 0
  s.each_char do |c|
    if c == "1"
      n += 1
    end
  end

  n
end
