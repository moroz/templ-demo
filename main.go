package main

import (
	"context"
	"os"
)

func main() {
	component := hello("World")
	component.Render(context.Background(), os.Stdout)
}
