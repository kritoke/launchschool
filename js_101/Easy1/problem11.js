function utf16Value(string1) {
    let result = 0;
    for(let i = 0; i < string1.length; i++) {
        result = result + string1.charCodeAt(i);
    }
    return result;
}