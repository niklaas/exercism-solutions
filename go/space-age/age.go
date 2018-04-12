/*
Package space provides a function to convert ages to their representation on
different planets
*/
package space

// Planet represents the name of a planet as string
type Planet string

var p = map[Planet]float64{
	"Earth":   1.0,
	"Mercury": 0.2408467,
	"Venus":   0.61519726,
	"Mars":    1.8808158,
	"Jupiter": 11.862615,
	"Saturn":  29.447498,
	"Uranus":  84.016846,
	"Neptune": 164.79132,
}

const earthSeconds float64 = 31557600

// Age converts seconds to planet years for the specified planet
func Age(seconds float64, planet Planet) float64 {
	return seconds / (earthSeconds * p[planet])
}
