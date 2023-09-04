let input = require('readline-sync');
const SQMETERS_TO_FEET = 10.7639;

let length = input.question("Enter the length of the room in meters:\n");
let width = input.question("Enter the width of the room in meters:\n");
let area = length * width;

console.log("The area of the room is " + area + " square meters (" + (area * SQMETERS_TO_FEET).toFixed(2) + " square feet).");