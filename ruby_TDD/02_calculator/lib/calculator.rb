def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def sum(a)
  return 0 if a.empty?
  a.inject:+
end

def multiply(a)
  return 0 if a.empty?
  a.inject:*
end

def power(a, b)
 a**b
end

def factorial(a)
  return 1 if a == 0
  (1..a).to_a.inject:*
end

p factorial(4)