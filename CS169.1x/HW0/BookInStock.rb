class BookInStock

	def initialize(isbn, price)
		if check_isbn(isbn) and check_price(price)
			@isbn = isbn
			@price = price
		end
	end

	def isbn
		return @isbn
	end

	def isbn=(isbn)
		if check_isbn(isbn)
			@isbn = isbn
		end
	end

	def price
		return @price
	end

	def price=(price)
		if check_price(price)
			@price = price
		end
	end

	def price_as_string
		return sprintf('$%.2f', @price)
	end

	private

		def check_isbn(isbn)
			if isbn.length > 0
				true
			else
				raise ArgumentError,'ISBN cannot be empty'
			end
		end

		def check_price(price)
			if price > 0
				true
			else
				raise ArgumentError,"Price cannot be $#{price}"
			end
		end

end