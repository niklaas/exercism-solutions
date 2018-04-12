package grains

import (
	"errors"
)

// Square calculates the number of grains of wheat on a single square on a
// chessboard given that the number on each square doubles.
func Square(n int) (uint64, error) {
	if !isValidSquare(n) {
		return 0, errors.New("Number of squares out of bounds")
	}
	// A left shift x<<n is equivalent to multiplication by 2^n.
	return 1 << uint64(n-1), nil
}

// Total calculates the total amount of grains on all squares on the chessboard.
func Total() uint64 {
	// The total amount of grains is the amount of grains on square 64+1 minus a
	// single grain.
	return 1<<64 - 1
}

func isValidSquare(n int) bool {
	return n >= 1 && n <= 64
}
