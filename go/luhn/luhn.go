package luhn

import (
	"unicode"
)

// Valid checks whether a string is valid per the Luhn formula
func Valid(s string) bool {
	var digits []int

	// Cleans input string and saves it in slice of int
	for _, r := range s {
		switch {
		case unicode.IsSpace(r):
			continue
		case !unicode.IsDigit(r):
			return false
		}
		// ASCII codes for numerals are 48 to 57 i.e., 0 is represented as 48.
		// If we substract 0 (48) from the rune and convert the resulting rune
		// to its integer representation, we get the actual integer that the
		// rune represented originally.
		//
		// See https://codereview.stackexchange.com/a/122931/161411 for a
		// discussion on how to parse numerals from a string.
		digits = append(digits, int(r-'0'))
	}
	if len(digits) <= 1 {
		return false
	}

	// Doubles every second digit from the right if this wouldn't return a
	// number greater than 9
	for i := len(digits) - 2; i >= 0; i -= 2 {
		if dbl := digits[i] * 2; dbl > 9 {
			digits[i] = dbl - 9
		} else {
			digits[i] = dbl
		}
	}

	// Calculates the sum of all digits
	sum := 0
	for _, d := range digits {
		sum += d
	}

	return sum%10 == 0
}
