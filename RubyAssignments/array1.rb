#!user/bin/ruby


array1 =Array.new(5) {|e| e = e*10+1 }
array2 =Array(0..9)
array3=["Hello", "World"]
array4=Array.new(4,"Names")

def combine (arr1,arr2)
combine_array = Array.new

 (0..arr1.size-1). each do |i|
	
	 combine_array[i] = arr1[i]
 end
 
 (arr1.size..arr1.size+arr2.size-1).each do |i|
 
	 combine_array[i] = arr2[i-arr1.size]
 end
 
 return combine_array
 
end

combined_array = combine(array1,array2)
puts "#{array1}, #{array2} \n #{combined_array}"

#puts "#{x}, #{y} \n #{c}"
#puts "#{arr1}, #{x} \n #{c}"

