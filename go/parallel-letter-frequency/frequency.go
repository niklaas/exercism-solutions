package letter

// FreqMap maps runes to their frequency
type FreqMap map[rune]int

// Frequency returns the frequency of each rune in a string
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

// ConcurrentFrequency runs Frequency concurrently
func ConcurrentFrequency(ss []string) FreqMap {
	fms := make(chan FreqMap, len(ss))
	defer close(fms)
	for _, s := range ss {
		go func(s string) { fms <- Frequency(s) }(s)
	}

	m := make(FreqMap)
	for range ss {
		for k, v := range <-fms {
			m[k] += v
		}
	}
	return m
}
