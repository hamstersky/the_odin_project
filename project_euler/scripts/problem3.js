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
  document.getElementById("output3").innerHTML = "Result: " + largest_divisor;
};