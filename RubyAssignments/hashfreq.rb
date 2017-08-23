#!user/bin/ruby

array = [1,2,3,2,1,4,5,4,4,4,6,7,8,9,0,7,0,8,9,9,5,6,4]

result = Hash.new(0)

array.each { |i| result[i] += 1 } 

puts result

=begin
output:

{1=>2, 2=>2, 3=>1, 4=>5, 5=>2, 6=>2, 7=>2, 8=>2, 9=>3, 0=>2}

=end
