package main

import (
    "fmt"
    "os"
)

func main() {
    var s, sep string

    for i := 1; i < len(os.Args); i++ {
        s += sep + os.Args[i]
        sep = " "
    }

    fmt.Println(s)
}

// for initialization; condition; post {
        // zero or more statements
// }

// a traditional "while" loop
// for condition {
        // ...
// }

// for {
        // ...
// }

