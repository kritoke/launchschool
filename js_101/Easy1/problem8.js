function isLeapYear(year) {
    if (year > 0) {
        if ((year % 4 === 0)) {
            if (year % 100 === 0) {
                return (year % 400 === 0);
            } else return true;
        }
        else {
            return false;
        }
    }
    else {
        console.log("Invalid year given.")
    }
}