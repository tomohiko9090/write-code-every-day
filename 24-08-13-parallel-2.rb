require 'parallel'

Parallel.each(1..10, in_threads: 10) do |i|
  sleep 100
  puts i
end
