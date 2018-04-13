package letter

import (
	"sync"
)

// FreqMap maps a rune to its frequency
type FreqMap map[rune]int

// Frequency returns the frequency of each rune in a string
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

// ConcurrentFrequency run Frequency concurrently
func ConcurrentFrequency(ss []string) FreqMap {
	fms := make(chan FreqMap)
	var wg sync.WaitGroup
	for _, s := range ss {
		wg.Add(1)
		go func(s string) {
			defer wg.Done()
			fms <- Frequency(s)
		}(s)
	}

	go func() {
		wg.Wait()
		close(fms)
	}()

	m := make(FreqMap)
	for r := range fms {
		for k, v := range r {
			m[k] += v
		}
	}
	return m
}
