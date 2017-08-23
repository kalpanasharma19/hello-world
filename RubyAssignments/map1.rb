#!user/bin/ruby

sample_array = Array(0...6)

class Mapping
	def map_array(arr)

		array = arr

		puts " Sample array is : #{array} "

		output_array= array.map { |i| i * 2}

    puts " Output array is : #{output_array}"

	end
end

doubled_array = Mapping.new
doubled_array.map_array(sample_array)

print "\n"

=begin
output:

Sample array is : [0, 1, 2, 3, 4, 5] 
 Output array is : [0, 2, 4, 6, 8, 10]


=end
