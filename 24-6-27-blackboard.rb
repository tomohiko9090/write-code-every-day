require 'rspec'

def blackboard(num_list)
  n = 0
  flag = false

  while flag == false
    num = []
    num_list.each do |a|
      if a % 2 == 0
        num << (a / 2)
      else
        flag = true
        break
      end
    end

    if num.length == num_list.length
      num_list = num
      n += 1
    end
  end

  puts "割った回数: #{n}"
  puts "割った後のリスト:#{num_list}"
end

# RSpec.describe 'blackboard' do
#   it 'returns the correct number of divisions and final list for even numbers' do
#     result = blackboard([8, 4, 2])
#     expect(result[0]).to eq(2)
#     expect(result[1]).to eq([2, 1, 1])
#   end

#   it 'returns 0 divisions and the original list for a list with an odd number' do
#     result = blackboard([8, 3, 2])
#     expect(result[0]).to eq(0)
#     expect(result[1]).to eq([8, 3, 2])
#   end

#   it 'handles an empty list' do
#     result = blackboard([])
#     expect(result[0]).to eq(0)
#     expect(result[1]).to eq([])
#   end

#   it 'returns the correct number of divisions and final list for a mixed list' do
#     result = blackboard([16, 8, 4, 2])
#     expect(result[0]).to eq(3)
#     expect(result[1]).to eq([2, 1, 1, 1])
#   end
# end

# RSpec::Core::Runner.run([$__FILE__])
