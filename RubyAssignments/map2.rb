#!user/bin/ruby

sample_array1 = Array(0...6)
sample_array2 = ["h", "i"]

class Use_map_function
  def map_array (array1, array2)

    array12= array1 + array2

    output_array= array12.map{|i| i*2}

    puts " First array is : \n #{array1} \n\n Second array is : \n #{array2} \n\n combined array of first and second is :\n #{array12} \n\n mapped array is : \n #{output_array}"
  end
end

mapped_array = Use_map_function.new
mapped_array.map_array(sample_array1, sample_array2)

puts "\n"

=begin
output :

 First array is : 
 [0, 1, 2, 3, 4, 5] 

 Second array is : 
 ["h", "i"] 

 combined array of first and second is :
 [0, 1, 2, 3, 4, 5, "h", "i"] 

 mapped array is : 
 [0, 2, 4, 6, 8, 10, "hh", "ii"]


=end
