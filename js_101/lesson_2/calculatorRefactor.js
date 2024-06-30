const readline = require('readline-sync');
const promptImport = require('./calculator_messages.json');

let calculateAgain = false;

function prompt(message) {
  console.log(`=> ${message}`);
}

function invalidNumber(num) {
  return num.trimStart() === '' || Number.isNaN(Number(num));
}

do {
  prompt(promptImport.en.welcome);

  prompt(promptImport.en.firstNum);
  let number1 = readline.question();

  while (invalidNumber(number1)) {
    prompt(promptImport.en.invalidNum);
    number1 = readline.question();
  }

  prompt(promptImport.en.secondNum);
  let number2 = readline.question();

  while (invalidNumber(number2)) {
    prompt(promptImport.en.invalidNum);
    number2 = readline.question();
  }

  prompt(promptImport.en.operationQuestion);
  let operation = readline.question();

  while (!['1', '2', '3', '4'].includes(operation)) {
    prompt("Must choose 1, 2, 3, or 4.");
    operation = readline.question();
  }

  let output;
  switch (operation) {
    case '1':
      output = Number(number1) + Number(number2);
      break;
    case '2':
      output = Number(number1) - Number(number2);
      break;
    case '3':
      output = Number(number1) * Number(number2);
      break;
    case '4':
      output = Number(number1) / Number(number2);
      break;
  }

  prompt(`${promptImport.en.result} ${output}.`);

  prompt(promptImport.en.anotherOperation);
  let continueAnswer = readline.question().toLowerCase();

  while (!['n', 'y'].includes(continueAnswer)) {
    prompt(promptImport.en.incorrectAnswer);
    continueAnswer = readline.question().toLowerCase();
  }

  switch (continueAnswer) {
    case 'n':
      calculateAgain = false;
      break;
    case 'y':
      calculateAgain = true;
      break;
  }


} while (calculateAgain === true);
