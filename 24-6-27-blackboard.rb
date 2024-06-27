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

  [n, num_list]
end
