def fibo(max)
	a, b, sum = 1, 2, 0
	until b >= max
		sum += b if b.even?
		a, b = b, a + b
	end
	sum
end

p fibo(1000)