package isogram

import (
	"strings"
	"unicode"
)

// IsIsogram tests whether a string is an isogram i.e., every character only
// appears once.
func IsIsogram(s string) bool {
	m := make(map[rune]bool)
	for _, r := range strings.ToLower(s) {
		if m[r] {
			return false
		}
		// Only insert alphanumeric characters into the map
		if unicode.IsLetter(r) {
			m[r] = true
		}
	}
	return true
}
