#!user/bin/ruby


def print_count (n)

	count=1
	while count <= n
		print " #{count}" # Will print counting in a row
		# puts count      #Will print counting in a column
		count +=1
	end
	print "\n"

end
print_count(50)

# Another way to print counting

=begin
for i in 1..100

	puts "#{i}"

end
=end
