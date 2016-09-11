var multiples = function() {
  var sum = 0;
  var maxNumber = document.getElementById("input1").value;
  for (var i = 1; i < maxNumber; i++) {
    if ((i % 3 === 0) || (i % 5 === 0)) {
     sum += i;
    }
  }
  document.getElementById("output1").innerHTML = "Result: " + sum;
};