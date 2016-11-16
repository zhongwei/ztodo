package memo_test

import (
    "testing"

    "gopl/ch09/memo2"
    "gopl/ch09/memotest"
)

var httpGetBody = memotest.HTTPGetBody

func Test(t *testing.T) {
    m := memo.New(httpGetBody)
    memotest.Sequential(t, m)
}

func TestConcurrent(t *testing.T) {
    m := memo.New(httpGetBody)
    memotest.Concurrent(t, m)
}
