package raindrops

import (
	"strconv"
)

// Convert translates to raindrop-speak
func Convert(value int) string {
	var match string
	if value%3 == 0 {
		match += "Pling"
	}
	if value%5 == 0 {
		match += "Plang"
	}
	if value%7 == 0 {
		match += "Plong"
	}

	if match != "" {
		return match
	}
	return strconv.Itoa(value)
}
