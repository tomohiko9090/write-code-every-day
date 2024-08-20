require 'parallel'

Parallel.each(1..10, in_processes: 10) do |i|
  sleep 10
  puts i
end
