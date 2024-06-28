s = "110000101"
n = 0

s.each_char do |c|
  if c == "1"
    n += 1
  end
end

class TestOneJadge < Minitest::Test
  def test_one_jadge
    result = one_jadge(s)
    assert_equal n, result
  end
end
