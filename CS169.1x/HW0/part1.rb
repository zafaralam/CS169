def sum(array)
	if array.length == 0
		then 0
	else
		array.inject{|sum,x| sum+x}
	end
end

def max_2_sum(array)
	if array.length == 0
			return 0
		elsif array.length == 1
			return array[0]
	else
		array.sort!
		len = array.length
		array[len-1] + array[len-2]
	end
end

def sum_to_n?(array, n)
	if array.length == 0
		if n == 0
			return true
		else
			return false
		end
	else
		i = 0
		len = array.length
		while i < len do
			k = i + 1
			while k < len do
				if(array[i]+array[k] == n)
				 	return true
				end
				k += 1
			end
			i += 1
		end 
	end

	return false
end