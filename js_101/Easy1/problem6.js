let input = require('readline-sync');

let number = input.question("Please enter an integer greater than 0: ");
while (isNaN(number) || (number < 1)) {
    console.log("The provided integer is not valid.");
    number = input.question("Please enter an integer greater than 0: ");
}

let operation = input.question('Enter "s" to compute the sum, or "p" to compute the product. ').toLowerCase();
let result = 0;

function computeResult(operation)
{
    switch (operation) {
        case 's':
            for (let i = 1; i <= number; i++){
                result = result + i;
            }
            console.log(`The sum of the integers between 1 and ${number} is ${result}.`)
            break;
        case 'p':
            result = 1;
            for (let i = 1; i <= number; i++){
                result = result * i;
            }
            console.log(`The product of the integers between 1 and ${number} is ${result}.`)
            break;
        default:
            console.log("Invalid operation choice given.");
            operation = input.question('Enter "s" to compute the sum, or "p" to compute the product. ').toLowerCase();
            computeResult(operation);
            break;
    }
}

computeResult(operation);


