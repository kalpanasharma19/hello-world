#!user/bin/ruby

array1 =Array.new(5) {|e| e = e*10+1 }
array2 =Array(0..9)
array3 =Array.new(4,"mac")
combine_array= Array.new

combine_array = array1 + array2 + array3

puts "#{array1}, #{array2}, #{array3} \n #{combine_array}"
