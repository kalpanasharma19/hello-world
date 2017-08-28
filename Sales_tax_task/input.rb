module SalesTaxCalculator

	class Input

		def takeBasket()
			basket = []

			puts "Give me input"
			while true
     		input = gets.chomp
     		break if input.empty?
      	basket << input
    	end

    	get_input(basket)
		
		end

	
		def get_input(input_array)
			require "csv"
			CSV.open("saleRecords.csv", "wb") do |csv|

				input_array.each do | each_item |
					i_item = each_item.split
					quantity = i_item[0].to_i
					price = i_item[-1].to_f

					product = each_item.split(" at")
					product_name = product[0].delete("/0-9/")
					
					csv << [ product_name, quantity, price ]
				end
			end
		end
	end

end

