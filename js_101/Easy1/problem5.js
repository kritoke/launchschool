let input = require('readline-sync');

let bill = input.question("What is the bill? ");
let tipPercent = input.question("What is the tip percentage? ");

let tip = parseFloat((bill * tipPercent/100).toFixed(2));
let total = parseFloat(bill) + parseFloat(tip);

console.log("The tip is $" + tip);
console.log("The total is $" + total);

