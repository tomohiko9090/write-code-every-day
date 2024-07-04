# 英小文字からなる文字列
#  が与えられます。
#  が空文字列である状態から始めて、以下の操作を好きな回数繰り返すことで
#  とすることができるか判定してください。

#  の末尾に "dream", "dreamer", "erase", "eraser" のいずれかを追加する。
# 【制約】

#  は英小文字からなる
# 【数値例】
# 1)
# 　
#  = "dreameraser"
# 　答え: "YES"

# "dream", "eraser" の順で
#  の末尾に追加することで
#  とすることができます。



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
          break
        end
      end
    end

    if s != "" && !words.any? { |word| s.include?(word) }
      answer = "NO"
    end
  end

  answer
end
