#!user/bin/ruby

array1 = Array(0...6)

array2 = ["h", "i"]

array12= array1 + array2

output_array= array12.map{|i| i*2}

puts "#{array1}, #{array2} \n #{array12} \n #{output_array}"
