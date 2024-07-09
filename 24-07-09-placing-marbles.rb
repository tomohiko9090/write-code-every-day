# 1.問題
# https://qiita.com/drken/items/fd4e5e3630d0f5859067#%E7%AC%AC-4-%E5%95%8F--abc-087-b---coins-200-%E7%82%B9

# 2.ライブラリ導入
require 'minitest/autorun'
require 'pry'

# 3.テストコード
class Test < Minitest::Test
  def test_1
    result = marbles("101")
    assert_equal 2, result
  end

  def test_2
    result = marbles("1011164236")
    assert_equal 4, result
  end
end

# 4.回答コード
# 自分が作ったやつ
# def marbles(s)
#   cnt = 0

#   s.chars.map(&:to_i).each do |i|
#     if i == 1
#       cnt += 1
#     end
#   end

#   cnt
# end

# ↓これがベスト
def marbles(s)
  cnt = s.count('1')
end
