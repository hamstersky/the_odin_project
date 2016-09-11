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
  document.getElementById("output2").innerHTML = "Result: " + sum;
};