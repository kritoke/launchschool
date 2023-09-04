function isEven(number)
{
    let result = number % 2;
    return result === 0;
}

function logEven(begNumber, endNumber) {
    let currNum = begNumber;
    while (currNum <= endNumber)
    {
        if(isEven(currNum)) console.log(currNum);
        currNum++;
    }
}

logEven(1, 99);