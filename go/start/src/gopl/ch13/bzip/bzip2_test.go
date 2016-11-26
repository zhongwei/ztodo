package bzip_test

import (
    "bytes"
    "compress/bzip2"
    "io"
    "testing"

    "gopl/ch13/bzip"
)

func TestBzip2(t *testing.T) {
    var compressed, uncompressed bytes.Buffer
    w := bzip.NewWriter(&compressed)

    tee := io.MultiWriter(w, &uncompressed)
    for i := 0; i < 1000000; i++ {
        io.WriteString(tee, "hello")
    }

    if err := w.Close(); err != nil {
        t.Fatal(err)
    }

    if got, want := compressed.Len(), 255; got != want {
        t.Errorf("1 million hellos compressed to %d bytes, want %d", got, want)
    }

    var decompressed bytes.Buffer
    io.Copy(&decompressed, bzip2.NewReader(&compressed))
    if !bytes.Equal(uncompressed.Bytes(), decompressed.Bytes()) {
        t.Error("decompression yielded a different message")
    }
}
