# 1.問題
# https://qiita.com/drken/items/fd4e5e3630d0f5859067#%E7%AC%AC-8-%E5%95%8F--abc-085-c---otoshidama-300-%E7%82%B9

# 2.ライブラリ導入
require 'minitest/autorun'
require 'pry'

# 3.テストコード
class Test < Minitest::Test
  def test_1
    result = kane(9, 45000)
    assert_equal "4 0 5", result
  end
end

# 4.回答コード
def kane(n, y)
  res10000 = -1
  res5000 = -1
  res1000 = -1

  (0..n).each do |a|  # 10000円の枚数を 0 〜 N で調べる
    (0..(n - a)).each do |b|  # 5000円の枚数を 0 〜 N-a で調べる
      c = n - a - b  # 1000円の枚数は決まる
      total = 10000 * a + 5000 * b + 1000 * c
      if total == y  # 答えが見つかったら
        res10000 = a
        res5000 = b
        res1000 = c
        break
      end
    end
    break if res10000 != -1  # 既に答えが見つかっている場合はループを抜ける
  end

  "#{res10000} #{res5000} #{res1000}"
end
