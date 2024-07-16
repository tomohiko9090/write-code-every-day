# 1.問題
# https://qiita.com/drken/items/fd4e5e3630d0f5859067#%E7%AC%AC-8-%E5%95%8F--abc-085-c---otoshidama-300-%E7%82%B9

# 2.ライブラリ導入
require 'minitest/autorun'
require 'pry'

# 3.テストコード
class Test < Minitest::Test
  def test_1
    result = kane(9, 45000)
    assert_equal (4, 0 ,5), result
  end
end

# 4.回答コード
def kane(piece, money)

end
