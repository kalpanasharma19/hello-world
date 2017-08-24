#!user/bin/ruby


array1 =Array.new(5) { |e| e = e * 10 + 1 }
array2 =Array(0..9)

class Join_array
  def combine (arr1, arr2)
  combine_array = Array.new

    (0..arr1.size - 1). each do |i|
	
      combine_array[i] = arr1[i]
    end
 
    (arr1.size..arr1.size + arr2.size - 1).each do |i|

      combine_array[i] = arr2[i - arr1.size]
    end
 
    puts " First Array is : \n #{arr1} \n\n Second Array is : \n #{arr2} \n\n Combined Array is : \n #{combine_array}"
  end
end

combined_array  = Join_array.new
combined_array.combine(array1, array2)

puts "\n"

=begin
output :

 First Array is : 
 [1, 11, 21, 31, 41] 

 Second Array is : 
 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] 

 Combined Array is : 
 [1, 11, 21, 31, 41, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


=end
