#!user/bin/ruby

class Counting
  def print_count (n)

	  count=1
	  
	  while count <= n
	  
		  print " #{count}" # Will print counting in a row
		  # puts count      #Will print counting in a column
		  
		  count +=1
		  
	  end
	  
	  print "\n"

  end
end
c = Counting.new
c.print_count(80)
print "\n"

# Another way to print counting

=begin
for i in 1..100

	puts "#{i}"

end
=end

=begin

output :
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 
=end
