/*
Package twofer enables sharing (which is caring)
*/
package twofer

// ShareWith should have a comment documenting it.
func ShareWith(s string) string {
	if s == "" {
		s = "you"
	}
	return "One for " + s + ", one for me."
}
