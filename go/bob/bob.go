/*
Package bob implements a very, very simple chatbot.
*/
package bob

import (
	"regexp"
	"strings"
)

// Hey responds to remarks in a very simple way.
func Hey(remark string) string {
	switch {
	case isQuestion(&remark) && isUpper(&remark):
		return "Calm down, I know what I'm doing!"
	case isUpper(&remark):
		return "Whoa, chill out!"
	case isQuestion(&remark):
		return "Sure."
	case isSilence(&remark):
		return "Fine. Be that way!"
	default:
		return "Whatever."
	}
}

func isUpper(s *string) bool {
	words, _ := regexp.MatchString("[a-zA-z]", *s)
	return strings.ToUpper(*s) == *s && words
}

func isQuestion(s *string) bool {
	question, _ := regexp.MatchString("\\? *$", *s)
	return question
}

func isSilence(s *string) bool {
	silence, _ := regexp.MatchString("^[ \\t\\n\\r]*$", *s)
	return silence
}
