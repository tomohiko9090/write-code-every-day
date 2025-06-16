# Definition for a binary tree node.

# require_relative './customtypes.rb'

class TreeNode
    attr_accessor :val, :left, :right
    
    def initialize(val = 0, left = nil, right = nil)
      @val = val
      @left = left
      @right = right
    end
  end

def solution(root)
    
    if root == nil
        return 0
    end

    p root.left
    p root.right
    if root.left == nil && root.right == nil
        return 1
    end

    if root.left&.left == nil && root.left&.right == nil && root.right&.left == nil && root.right&.right == nil
        return 2
    end

    return 3

    # if root.left.val = nil && root.right.val = nil
    #     return 2
    # end

    # p root.val
    # p root.left.val
    # p root.right.val
    
    # root = TreeNode.new(1)
    # root.left = TreeNode.new(2)
    # root.left.left = TreeNode.new(3)
    # root.left.right = TreeNode.new(4)

    # root.right = TreeNode.new(5)
    # root.right.left = TreeNode.new(5)
    
    # level_nodes = []

    # level_nodes << root.val
    # level_nodes << root.left.val
    # level_nodes << root.right.val

    # level_nodes
    # p root

end

# 例1〜5のテストコード

class TreeNode
    attr_accessor :val, :left, :right
    
    def initialize(val = 0, left = nil, right = nil)
      @val = val
      @left = left
      @right = right
    end
  end
  
  def solution(root)
    if root == nil
      return 0
    end
  
    p root.left
    p root.right
    
    if root.left == nil && root.right == nil
      return 1
    end
  
    # 安全にレベル2をチェック
    left_has_no_children = (root.left == nil) || (root.left.left == nil && root.left.right == nil)
    right_has_no_children = (root.right == nil) || (root.right.left == nil && root.right.right == nil)
    
    if left_has_no_children && right_has_no_children
      return 2
    end
  
    return 3
  end
  
  puts "=== 例1のテスト: [1,2,3] → 期待値: 2 ==="
  # 木の構造:
  #     1
  #    / \
  #   2   3
  root1 = TreeNode.new(1)
  root1.left = TreeNode.new(2)
  root1.right = TreeNode.new(3)
  
  puts "入力: [1,2,3]"
  puts "木の構造:"
  puts "    1"
  puts "   / \\"
  puts "  2   3"
  
  result1 = solution(root1)
  puts "出力: #{result1}"
  puts "期待値: 2"
  puts "正解？ #{result1 == 2 ? 'はい!' : 'いいえ'}"
  
  puts "\n" + "="*50
  
  puts "=== 例2のテスト: [0] → 期待値: 1 ==="
  # 木の構造:
  # 0
  root2 = TreeNode.new(0)
  
  puts "入力: [0]"
  puts "木の構造:"
  puts "0"
  
  result2 = solution(root2)
  puts "出力: #{result2}"
  puts "期待値: 1"
  puts "正解？ #{result2 == 1 ? 'はい!' : 'いいえ'}"
  
  puts "\n" + "="*50
  
  puts "=== 例3のテスト: [1,null,2] → 期待値: 2 ==="
  # 木の構造:
  #   1
  #    \
  #     2
  root3 = TreeNode.new(1)
  root3.right = TreeNode.new(2)
  
  puts "入力: [1,null,2]"
  puts "木の構造:"
  puts "1"
  puts " \\"
  puts "  2"
  
  result3 = solution(root3)
  puts "出力: #{result3}"
  puts "期待値: 2"
  puts "正解？ #{result3 == 2 ? 'はい!' : 'いいえ'}"
  
  puts "\n" + "="*50
  
  puts "=== 例4のテスト: [1,2,3,4,null,null,5] → 期待値: 3 ==="
  # 木の構造:
  #       1
  #      / \
  #     2   3
  #    /     \
  #   4       5
  root4 = TreeNode.new(1)
  root4.left = TreeNode.new(2)
  root4.right = TreeNode.new(3)
  root4.left.left = TreeNode.new(4)
  root4.right.right = TreeNode.new(5)
  
  puts "入力: [1,2,3,4,null,null,5]"
  puts "木の構造:"
  puts "      1"
  puts "     / \\"
  puts "    2   3"
  puts "   /     \\"
  puts "  4       5"
  
  result4 = solution(root4)
  puts "出力: #{result4}"
  puts "期待値: 3"
  puts "正解？ #{result4 == 3 ? 'はい!' : 'いいえ'}"
  
  puts "\n" + "="*50
  
  puts "=== 例5のテスト: [] → 期待値: 0 ==="
  # 木の構造: なし（空の木）
  root5 = nil
  
  puts "入力: []"
  puts "木の構造: 空"
  
  result5 = solution(root5)
  puts "出力: #{result5}"
  puts "期待値: 0"
  puts "正解？ #{result5 == 0 ? 'はい!' : 'いいえ'}"
  
  puts "\n" + "="*50
  puts "=== 全体の結果 ==="
  puts "例1 [1,2,3]: #{result1 == 2 ? '✅' : '❌'} (出力: #{result1})"
  puts "例2 [0]: #{result2 == 1 ? '✅' : '❌'} (出力: #{result2})"
  puts "例3 [1,null,2]: #{result3 == 2 ? '✅' : '❌'} (出力: #{result3})"
  puts "例4 [1,2,3,4,null,null,5]: #{result4 == 3 ? '✅' : '❌'} (出力: #{result4})"
  puts "例5 []: #{result5 == 0 ? '✅' : '❌'} (出力: #{result5})"