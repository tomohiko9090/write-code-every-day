
print "年齢を入力してください："
age_input = gets.chomp

begin
  age = Integer(age_input)
  if age < 0 || age > 130
    puts "0以上130以下で入力してください"
  else
    puts "#{age}歳で登録しました"
  end
rescue ArgumentError
  puts "整数で入力してください"
rescue TypeError
  puts "無効な入力です: 正しい型のデータを入力してください"
end
