/*
Package acronym provides a function to abbreviate a string to its acronyms.
*/
package acronym

import (
	"strings"
)

// Abbreviate returns the acronym of a string, using words separated by spaces or hyphens
func Abbreviate(s string) string {
	a := ""
	for _, w := range strings.FieldsFunc(s, func(r rune) bool {
		return r == ' ' || r == '-'
	}) {
		a += string(w[0])
	}
	return strings.ToUpper(a)
}
