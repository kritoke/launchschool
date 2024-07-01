// GET Loan Amount
// GET APR
// Get Loan Duration
// CALCULATE monthly APR (APR/12)
// CALCULATE duration in months

const readline = require('readline-sync');

function prompt(message) {
  console.log(`=> ${message}`);
}

prompt("What is the loan amount?");
let loanAmount = readline.question();

prompt("What is the APR?");
let aprAmount = readline.question();

prompt("What is the Loan Duration?");
let loanDuration = readline.question();

console.log(`Loan Amount: ${loanAmount}`);
console.log(`APR: ${aprAmount}`);
console.log(`Loan Duration: ${loanDuration}`);