#!user/bin/ruby

array1 =Array.new(5) { |e| e = e * 10 + 1 }
array2 =Array(0..9)
array3 =Array.new(4, "mac")
combine_array= Array.new

combine_array = array1 + array2 + array3

puts " First Array is : \n #{array1} \n\n Second Array is : \n #{array2} \n\n Third Array is : \n #{array3} \n\n Combined Array is : \n #{combine_array}"


=begin
output:

First Array is : 
 [1, 11, 21, 31, 41] 

 Second Array is : 
 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] 

 Third Array is : 
 ["mac", "mac", "mac", "mac"] 

 Combined Array is : 
 [1, 11, 21, 31, 41, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, "mac", "mac", "mac", "mac"]

=end
