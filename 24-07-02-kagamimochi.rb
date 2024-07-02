# 1.問題
# https://qiita.com/drken/items/fd4e5e3630d0f5859067#%E7%AC%AC-7-%E5%95%8F--abc-085-b---kagami-mochi-200-%E7%82%B9

# 2.ライブラリ導入
require 'minitest/autorun'
require 'pry'

# 3.テストコード
class Test < Minitest::Test
  def test_1
    result = kagamimochi([8, 10, 8, 6])
    assert_equal 3, result
  end

  def test_2
    result = kagamimochi([1, 5, 2, 5, 5, 3, 4, 5])
    assert_equal 5, result
  end

  def test_3
    result = kagamimochi([])
    assert_equal 0, result
  end
end

# 4.回答コード
def kagamimochi(array)
  len = array.length

  return 0 if len == 0

  (array.max + 1).times do |i|
    if array.include?(i)
      dup = array.count(i)
      len -= (dup - 1)
    end
  end

  len
end
