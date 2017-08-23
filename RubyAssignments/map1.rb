#!user/bin/ruby

array = Array(0...6)

puts "#{array}"

array= array.map{|i| i*2}

puts "#{array}"


=begin
output:

[0, 1, 2, 3, 4, 5]
[0, 2, 4, 6, 8, 10]

=end
