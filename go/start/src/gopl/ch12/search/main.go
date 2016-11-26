package main

import (
    "fmt"
    "log"
    "net/http"
)

import "gopl/ch12/params"

func search(resp http.ResponseWriter, req *http.Request) {
    var data struct {
        Labels      []string    `http:"l"`
        MaxResults  int         `http:"max"`
        Exact       bool        `http:"x"`
    }

    data.MaxResults = 10
    if err := params.Unpack(req, &data); err != nil {
        http.Error(resp, err.Error(), http.StatusBadRequest)
        return
    }
    fmt.Fprintf(resp, "Search: %+v\n", data)
}

func main() {
    http.HandleFunc("/search", search)
    log.Fatal(http.ListenAndServe(":12345", nil))
}
