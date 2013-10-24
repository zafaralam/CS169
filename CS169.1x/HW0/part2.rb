def hello(name)
	return "Hello, " + name
end

def starts_with_consonant?(s)
	if /\A[^aeiou\W]/i =~ s
		return true
	else
		return false
	end
end

def binary_multiple_of_4?(s)
	if s =~ /^[-+]?[0-9]+$/
		if s.to_i % 4 == 0  and s.to_i != 0
			return true
		else
			return false
		end
	else
		return false
	end
end

puts binary_multiple_of_4?("0")