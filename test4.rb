# 1. テストの時に使う
# 2. 開発中に使う
# 3.インシデント起きたとき?

# ローカル環境
# テスト環境

require 'memory_profiler'

class Test
  def run
    # MemoryProfiler.start

    res1 = light
    res2 = heavy
    res3 = heavy_without_leak

    # MemoryProfiler.stop.pretty_print(to_file: "./report.txt")
  end

  private

  def light
    (0...1000).map { |_| Object.new }
    # 1,000 Objectsの参照保持
  end

  def heavy
    (0...10000).map { |_| Object.new }
    # 10,000 Objectsの参照保持
  end

  def heavy_without_leak
    (0...10000).each { |_| Object.new }
    # 10,000 Objects生成するが保持はしない
  end
end


test = Test.new
test.run
