package reverse

// String reverses a string (no clue, why it's named that way but that's what
// the test cases state)
func String(s string) string {
	rs := []rune(s)
	// Swaps slice of runes from outside to inside
	for i, j := 0, len(rs)-1; i < j; i, j = i+1, j-1 {
		rs[i], rs[j] = rs[j], rs[i]
	}
	return string(rs)
}
