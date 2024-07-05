# 1.問題
# https://qiita.com/drken/items/fd4e5e3630d0f5859067#%E7%AC%AC-9-%E5%95%8F--abc-049-c---daydream-300-%E7%82%B9

# 2.ライブラリ導入
require 'minitest/autorun'
require 'pry'

# 3.テストコード
class Test < Minitest::Test
  def test_1
    result = daydream("dreameraser")
    assert_equal "YES", result
  end

  def test_2
    result = daydream("ddddddddddd")
    assert_equal "NO", result
  end

  def test_3
    result = daydream("dream")
    assert_equal "YES", result
  end
end

# 4.回答コード
def daydream(s)
  words = ["dream", "dreamer", "eraser", "erase"]
  answer = ""

  # 入っていたらその文字を削除
  loop do
    if answer != ""
      break
    end

    words.each do |word|
      if s.include?(word)
        s = s.gsub(word, "")
      else
        if s == ""
          answer = "YES"
          breaks
        end
      end
    end

    if s != "" && !words.any? { |word| s.include?(word) }
      answer = "NO"
    end
  end

  answer
end
