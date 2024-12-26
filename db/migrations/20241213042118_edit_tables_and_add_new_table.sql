-- +goose Up
-- SQL in section 'Up' is executed when this migration is applied.

ALTER TABLE users ADD COLUMN email TEXT;

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id),
    comment TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- +goose Down
-- SQL section 'Down' is executed when this migration is rolled back.

DROP TABLE comments;
ALTER TABLE users DROP COLUMN email;
