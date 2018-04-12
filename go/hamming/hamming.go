package hamming

import (
	"errors"
)

// Distance calculates the hamming distance of two strings.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, errors.New("length of DNA sequences don't match")
	}
	var occ int
	for i := range a {
		if a[i] != b[i] {
			occ++
		}
	}
	return occ, nil
}
