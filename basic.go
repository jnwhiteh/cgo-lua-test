package main

import "fmt"
import "golua"

func main() {
	L := golua.NewState()
	L.NewTable()
	fmt.Printf("%q\n", L)
}
