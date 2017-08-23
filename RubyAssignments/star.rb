#!user/bin/ruby


class Pattern
  def print_star(n)
    for i in 0...n
      for j in 0...n
        if i >= j
	  print "*"
	else
	  print " "
	end
      end
	print "\n"
    end
  end
end

p = Pattern.new
p.print_star(10)
print "\n"


class Pyramid
  def print_star(n)
   (1..n).each do |i|
      (i..n).each do
        printf " "
      end
     (0...2 * i - 1).each do
       printf "*"
     end
     puts "\n"
    end
  end
end

p = Pyramid.new
p.print_star(10)
puts "\n"

=begin
output:

*         
**        
***       
****      
*****     
******    
*******   
********  
********* 
**********

          *
         ***
        *****
       *******
      *********
     ***********
    *************
   ***************
  *****************
 *******************


=end
