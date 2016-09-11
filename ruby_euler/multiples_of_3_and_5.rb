def multiples(max)
	#three = (1..max).select { |a| a % 3 == 0 }
	#five = (1..max).select { |a| a % 5 == 0 }
	multiples = (1...max).select { |a| a % 3 == 0 || a % 5 == 0}
	multiples.inject(:+)
end

p multiples(1000)