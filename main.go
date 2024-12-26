package main

import (
    "database/sql"
    _ "github.com/lib/pq"
    "github.com/pressly/goose/v3"
    "log"
)

func main() {
    db, err := sql.Open("postgres", "user=user password=password dbname=mydb sslmode=disable")
    if err != nil {
        log.Fatal(err)
    }

    if err := goose.Up(db, "db/migrations"); err != nil {
        log.Fatal(err)
    }
}
