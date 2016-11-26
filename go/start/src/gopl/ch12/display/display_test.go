package display

import (
    "io"
    "net"
    "os"
    "reflect"
    "sync"
    "testing"

    "gopl/ch07/eval"
)

func Example_expr() {
    e, _ := eval.Parse("sqrt(A / pi)")
    Display("e", e)
}

func Example_slice() {
    Display("slice", []*int{new(int), nil})
}

func Example_nilInterface() {
    var w io.Writer
    Display("w", w)
}

func Example_ptrToInterface() {
    var w io.Writer
    Display("&w", &w)
}

func Example_struct() {
    Display("x", struct{ x interface{} }{3})
}

func Example_interface() {
    var i interface{} = 3
    Display("i", i)
}

func Example_ptrToInterface2() {
    var i interface{} = 3
    Display("&i", &i)
}

func Example_array() {
    Display("x", [1]interface{}{3})
}

func Example_movie() {
    type Movie struct {
        Title, Subtitle string
        Year    int
        Color   bool
        Actor   map[string]string
        Oscars  []string
        Sequel  *string
    }

    strangelove := Movie {
        Title: "Dr. strangelove",
        Subtitle: "How I Learned to Stop Worrying and Love the Bomb",
        Year:   1964,
        Color:  false,
        Actor:  map[string]string {
            "Dr. Strangelove":              "Peter Sellers",
            "Grp. Capt. Lionel Mandrake":   "Peter Sellers",
            "Pres. Merkin Muffley":         "Peter Sellers",
            "Gen. Buck Turgidson":          "George C. Scott",
            "Brig. Gen. Jack D. Ripper":    "Sterling Hayden",
            `Maj. T.J. "King" Kong`:        "Slim Pickens",
        },

        Oscars: []string {
            "Best Actor (Nomin.)",
            "Best Adapted Screenplay (Nomin.)",
            "Best Director (Nomin.)",
            "Best Picture (Nomin.)",
        },
    }
    Display("strangelove", strangelove)
}

func Test(t *testing.T) {
    Display("os.Stderr", os.Stderr)

    var w io.Writer = os.Stderr
    Display("&w", &w)

    var locker sync.Locker = new(sync.Mutex)
    Display("(&locker)", &locker)
    Display("locker", locker)

    locker = nil
    Display("(&locker)", &locker)

    ips, _ := net.LookupHost("golang.org")
    Display("ips", ips)

    Display("rV", reflect.ValueOf(os.Stderr))

    type P *P
    var p P
    p = &p
    if false {
        Display("p", p)
    }

    type M map[string]M
    m := make(M)
    m[""] = m
    if false {
        Display("m", m)
    }

    type S []S
    s := make(S, 1)
    s[0] = s
    if false {
        Display("s", s)
    }

    type Cycle struct {
        value int
        Tail *Cycle
    }

    var c Cycle
    c = Cycle{42, &c}
    if false {
        Display("c", c)
    }

}
