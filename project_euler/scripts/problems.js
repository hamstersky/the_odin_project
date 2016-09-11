var multiples = function() {
  var sum = 0;
  var maxNumber = document.getElementById("input1").value;
  for (var i = 1; i < maxNumber; i++) {
    if ((i % 3 === 0) || (i % 5 === 0)) {
     sum += i;
    }
  }
  document.getElementById("output").innerHTML = sum;
};

var fibonacci = function() {
  var maxValue = document.getElementById("input2").value; // Maximum term value
  var term1 = 1; // first Fibonacci term
  var term2 = 2; // second Finbonacci term
  var nextTerm = term1 + term2; // next term in the sequence
  var sum = 2; // including 2 into the sum
  while (nextTerm < maxValue) {
    if (nextTerm % 2 === 0) { // checking if next term is even
      sum += nextTerm; // if even add it to the sum
    }
    term1 = term2;
    term2 = nextTerm
    nextTerm = term1 + term2;
  }
  document.getElementById("output").innerHTML = sum;
};

var factorization = function() {
  var numberToFactor = document.getElementById("input3").value; 
  var current_divisor = 2; // Initial divisor set to 2
  var largest_divisor = 0; // Declaring largest divisor variable
  while (numberToFactor > 1) {
    if (numberToFactor % current_divisor === 0) { // If the number is divisible by current divisor
      numberToFactor /= current_divisor; // Divide the number and set it
      if (current_divisor > largest_divisor) { 
        largest_divisor = current_divisor; 
      }
      current_divisor = 2;
    }
    else {
      current_divisor++; // If not divisible, increase the divisor by 1
    }
  }
  document.getElementById("output").innerHTML = largest_divisor;
};