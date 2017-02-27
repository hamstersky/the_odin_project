def fibs(n, result = [0, 1])
  a, b = result
  (n-2).times do
    a, b = b, (a + b)
    result << b
  end
  result
end

def fibs_rec(n, result = [0, 1])
  return [0] if n == 1
  return result if n == 2
  result << result[-2] + result[-1]
  fibs_rec(n - 1, result)
end

p fibs(10)
p fibs_rec(10)
