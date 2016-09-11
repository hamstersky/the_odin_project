def largest_prime(number)
  current_divisor = 2
  largest_divisor = 0
  while number > 1
    if number % current_divisor == 0
      number /= current_divisor
      if current_divisor > largest_divisor
        largest_divisor = current_divisor
      end
      current_divisor = 2
    else
      current_divisor += 1
    end
  end
  return largest_divisor
end

p largest_prime(600851475143)