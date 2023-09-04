function isOdd(number)
{
    let result = number % 2;
    return result !== 0;
}

function logOdd(begNumber, endNumber) {
    let currNum = begNumber;
    while (currNum <= endNumber)
    {
        if(isOdd(currNum)) console.log(currNum);
        currNum++;
    }
}

logOdd(1, 99);