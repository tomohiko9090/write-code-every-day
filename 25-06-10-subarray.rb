# 部分配列の定義
# 順序を保ったまま取り出して、連続した一部を取り出した配列

# [3,4,1,6,2]
#　num[6]ならば、[3,4,1,6], [4,1,6],[1,6],[6],[6,2]で、5個

#
# [1,1,1,1,1,1]
# num[1]ならば、[1]で、6個

def solution(nums)
  # 各インデックスiについて、以下の条件を満たす部分配列の数を返す：
  # nums[i]が部分配列内で唯一の最大値である → 自分より下の組み合わせを全通り考える
  # nums[i]が部分配列の最初または最後の要素である →　部分配列の中で自分自身が使われているindexをとってきて、それが最初か最後か判定させる
  
  # 実装計画
  # 0. 最後に返す空配列を作成する、numsが空ならそのまま「」を返す
  if nums.count == 0
    return []
  end

  result = []
  
  # 1. numsをループで回す
  nums.each_with_index do |num, target_index|
    count = 0  # このインデックスでの条件を満たす部分配列の数

    # 2. ループでとってきた数字が、numsの中で「自分より下の組み合わせ」を全通りとってくる
    # 開始位置: 0からtarget_indexまで（target_indexを含むため）
    subarrays = []
    (0..target_index).each do |start|
      # 終了位置: target_indexから最後まで（target_indexを含むため）
      (target_index...nums.length).each do |end_idx|
        subarrays << nums[start..end_idx]
      end
    end

    # その中で、numよりも大きい数字もしくは、同じ数字が入ってくるものは除外する
    filtered_subarrays = subarrays.select do |subarray|
      # 条件1: numより大きい数字が含まれていない
      no_bigger_numbers = subarray.all? { |element| element <= num }

      # 条件2: numと同じ数字が複数含まれていない（numは唯一の最大値）
      max_val = subarray.max
      same_as_max_count = subarray.count(max_val)
      is_unique_max = (max_val == num && same_as_max_count == 1)

      # 両方の条件を満たす場合のみ残す
      no_bigger_numbers && is_unique_max
    end

    # 3. 部分配列の中で自分自身が使われているindexをとってきて、それが最初か最後か判定させる
    filtered_subarrays.each do |subarray|
      # 部分配列内でnumの位置（インデックス）を全て取得
      num_indices = []
      subarray.each_with_index do |element, index|
        if element == num
          num_indices << index
        end
      end

      # numが最初（インデックス0）または最後（length-1）にあるかチェック
      is_first_or_last = num_indices.any? do |index|
        index == 0 || index == subarray.length - 1
      end

      # 4. 最初か最後であれば、+1し、そうでないなら、カウントしない
      if is_first_or_last
        count += 1
      end
    end

    # 5. カウントの数を配列に入れて、次のループへ
    result << count
  end
  
  # 6. 最後に、入れた配列を返す
  result
end
  
# テストケース
def test_solution
  test_cases = [
    {
      input: [3, 4, 1, 6, 2],
      expected: [1, 3, 1, 5, 1],
      description: "例1: 異なる値の配列"
    },
    {
      input: [1, 1, 1, 1, 1],
      expected: [1, 1, 1, 1, 1],
      description: "例2: 全て同じ値の配列"
    },
    {
      input: [1],
      expected: [1],
      description: "例3: 単一要素の配列"
    },
    {
      input: [],
      expected: [],
      description: "例4: 空の配列"
    },
    {
      input: [-3, -2, 1, 0, -5],
      expected: [1, 2, 5, 2, 1],
      description: "例5: 負の数を含む配列"
    }
  ]

  puts "=== 条件を満たす部分配列の数 テスト ==="
  puts
  
  all_passed = true
  
  test_cases.each_with_index do |test_case, index|
    puts "#{test_case[:description]}"
    puts "入力: #{test_case[:input].inspect}"
    puts "期待値: #{test_case[:expected].inspect}"
    
    begin
      result = solution(test_case[:input])
      puts "実際の結果: #{result.inspect}"
      
      if result == test_case[:expected]
        puts "✅ PASS"
      else
        puts "❌ FAIL"
        all_passed = false
      end
    rescue => e
      puts "❌ ERROR: #{e.message}"
      puts e.backtrace.first
      all_passed = false
    end
    
    puts "-" * 50
  end
  
  puts
  if all_passed
    puts "🎉 全てのテストが成功しました！"
  else
    puts "❌ いくつかのテストが失敗しました。"
  end
end

# デバッグ用: 詳細な実行過程を表示
def solution_debug(nums)
  puts "=== デバッグモード ==="
  puts "入力: #{nums.inspect}"
  puts
  
  if nums.count == 0
    puts "空の配列なので [] を返します"
    return []
  end

  result = []
  
  nums.each_with_index do |num, target_index|
    puts "--- インデックス #{target_index}: 値 #{num} ---"
    count = 0
    
    # 部分配列生成
    subarrays = []
    (0..target_index).each do |start|
      (target_index...nums.length).each do |end_idx|
        subarrays << nums[start..end_idx]
      end
    end
    puts "生成した部分配列 (#{subarrays.length}個): #{subarrays.inspect}"
    
    # フィルタリング
    filtered_subarrays = subarrays.select do |subarray|
      no_bigger_numbers = subarray.all? { |element| element <= num }
      max_val = subarray.max
      same_as_max_count = subarray.count(max_val)
      is_unique_max = (max_val == num && same_as_max_count == 1)
      no_bigger_numbers && is_unique_max
    end
    puts "フィルタ後 (#{filtered_subarrays.length}個): #{filtered_subarrays.inspect}"
    
    # 位置チェック
    valid_subarrays = []
    filtered_subarrays.each do |subarray|
      num_indices = []
      subarray.each_with_index do |element, index|
        if element == num
          num_indices << index
        end
      end
      
      is_first_or_last = num_indices.any? do |index|
        index == 0 || index == subarray.length - 1
      end
      
      if is_first_or_last
        count += 1
        valid_subarrays << subarray
        puts "  ✓ #{subarray.inspect} - #{num}の位置: #{num_indices.inspect}"
      else
        puts "  ✗ #{subarray.inspect} - #{num}の位置: #{num_indices.inspect} (端にない)"
      end
    end
    
    puts "最終的に有効な部分配列: #{valid_subarrays.inspect}"
    puts "この位置のカウント: #{count}"
    puts
    
    result << count
  end
  
  puts "最終結果: #{result.inspect}"
  result
end

# テスト実行
puts "通常のテスト:"
test_solution