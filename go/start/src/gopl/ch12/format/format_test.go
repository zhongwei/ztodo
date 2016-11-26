package format_test

import (
    "fmt"
    "testing"
    "time"

    "gopl/ch12/format"
)

func Test(t *testing.T) {
    var x int64 = 1
    var d time.Duration = 1* time.Nanosecond
    fmt.Println(format.Any(x))
    fmt.Println(format.Any(d))
    fmt.Println(format.Any([]int64{x}))
    fmt.Println(format.Any([]time.Duration{d}))
}
