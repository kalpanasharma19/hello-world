module SalesTaxCalculator
  class Bill

    def print_bill(details)

      total_sale_tax = 0
      total_price_of_all_products = 0

      puts "\n Your Bill\n"
      details.each do |product_tax_details|
# product_tax_details = [ product name, quantity of product, product price, sale tax ]

        total_price_of_product = (product_tax_details[2] + product_tax_details[3]) * product_tax_details[1]

        puts " #{product_tax_details[1]}#{product_tax_details[0]}: #{round_up(total_price_of_product)} \n"

        total_sale_tax += product_tax_details[1] * product_tax_details[3]
        total_price_of_all_products += round_up(total_price_of_product)

      end
      puts " Sales Taxes: #{round_up(total_sale_tax)} \n Total: #{total_price_of_all_products} \n"
    end

    def round_up(number)
      x1 = (number.round(2) * 100).to_i
      integer_part = (x1 / 100).to_i     # take the integer part of number
      decimal_part =  x1 % 100           # take the decimal part of number
      second_digit_decimal_part= decimal_part % 10

      decimal_part -= second_digit_decimal_part

      if second_digit_decimal_part > 5
        second_digit_decimal_part = 10
      elsif  second_digit_decimal_part != 0
        second_digit_decimal_part = 5
      end

      number = integer_part + (((decimal_part + second_digit_decimal_part) % 100 ).to_f ) / 100
      #return number
    end

  end
end
