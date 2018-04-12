package clock

import "fmt"

// Clock is a simple clock to be represented in  hh:mm when printing. That said,
// the simplest way to implement it is by representing the time in minutes only.
// Kudos to @anataeus whose code I read and surprised me.
type Clock int

// New creates a new Clock.
func New(hours, minutes int) Clock {
	t := (hours*60 + minutes) % (60 * 24)
	if t < 0 {
		t += 24 * 60
	}
	return Clock(t)
}

// Add adds a specified amount of minutes to a Clock.
func (c Clock) Add(minutes int) Clock {
	return New(0, int(c)+minutes)
}

// Subtract subtracts minutes from a Clock.
func (c Clock) Subtract(minutes int) Clock {
	return New(0, int(c)-minutes)
}

// String implements a Stringer for Clock.
func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c/60, c%60)
}
