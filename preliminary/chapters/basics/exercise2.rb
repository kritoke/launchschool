# Find the thousands, hundreds, tens, and ones place using modulo and division

thousands = 6789 / 1000
hundreds = 6789 % 1000 / 100
tens = 6789 % 1000 % 100 / 10
ones = 6789 % 1000 % 100 % 10