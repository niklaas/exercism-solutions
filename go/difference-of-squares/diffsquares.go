// Package diffsquares provides functions to calculate the square of sums, the
// sum of squares and their difference. See the following website on how to find
// the closed-form formulas: https://brilliant.org/wiki/sum-of-n-n2-or-n3/
package diffsquares

// SquareOfSums calculates (1 + 2 + 3 + ... + n)^2.
func SquareOfSums(n int) int {
	sum := n * (n + 1) / 2
	return sum * sum
}

// SumOfSquares calculates 1^2 + 2^2 + 2^2 + ... + n^2.
func SumOfSquares(n int) int {
	return n * (n + 1) * (2*n + 1) / 6
}

// Difference calculates the difference between SquareOfSums and SumOfSquares.
func Difference(n int) int {
	return SquareOfSums(n) - SumOfSquares(n)
}
