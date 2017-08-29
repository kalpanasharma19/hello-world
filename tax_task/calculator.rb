module SalesTaxCalculator
  class Calculator

    def calculate_tax(details)

      details.each do |product_details|
# product_details = [product_name, quantity, price]

        tax_rate = applicable_tax_rate(find_taxfree_products(product_details[0]), find_imported_product(product_details[0]))
        product_details[3] = product_details[2] * tax_rate

      end
      return details

    end
    def applicable_tax_rate (tax_free, imported)

      tax_rate = 0.10
      if tax_free
        tax_rate = 0
      end
      if imported
        tax_rate += 0.05
      end
      return tax_rate

    end

    def find_imported_product(product_name)

      product_name.include? 'imported'

    end

    def find_taxfree_products(product_name)

      tax_free_products = ['book', 'pills', 'chocolate', 'chocolates']

      tax_free_products.each do |item|

        if product_name.include? item
        return true
        end

      end
      return false

    end

  end
end
