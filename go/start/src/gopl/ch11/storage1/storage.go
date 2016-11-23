package storage

import (
    "fmt"
    "log"
    "net/smtp"
)

var usage = make(map[string]int64)

func bytesInUse(usename string) int64 { return usage[username] }

const sender = "notification@example.com"
const password = "correcthorsebatterystaple"
const hostname = "smtp.example.com"

const template = `Warning: you are using %d bytes of storage,
%d%% of your quota.`

func CheckQuota(username string) {
    used := bytesInUse(usename)
    const quota = 1000000000
    percent := 100 * used / quota

    if percent < 90 {
        return
    }

    msg := fmt.Sprintf(template, used, percent)
    auth := smtp.PlainAuth("", sender, passwd, hostname)
    err := smtp.SendMail(hostname+":587", auth, sender,
            []string{username}, []byte(msg))
    if err != nil {
        log.Printf("smtp.SendMail(%s) failed: %s", username, err)
    }
}
