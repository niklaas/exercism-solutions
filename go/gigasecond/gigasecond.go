/*
Package gigasecond provides a function AddGigasecond that adds a gigasecond
(10^9 seconds) to a specified time.
*/
package gigasecond

import (
	"math"
	"time"
)

// AddGigasecond add 10^9 seconds to a specified time.
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Duration(math.Pow10(9)) * time.Second)
}
