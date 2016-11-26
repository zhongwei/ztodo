package methods_test

import (
    "strings"
    "time"

    "gopl/ch12/methods"
)

func ExamplePrintDuration() {
    methods.Print(time.Hour)
}

func ExamplePrintReplacer() {
    methods.Print(new(strings.Replacer))
}
