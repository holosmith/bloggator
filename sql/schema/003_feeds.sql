-- +goose Up
CREATE TABLE feeds (
	id UUID PRIMARY KEY,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL,
	name TEXT NOT NULL,
	url TEXT UNIQUE NOT NULL,
	user_id UUID NOT NULL,
	FOREIGN KEY (user_id)
	REFERENCES users(id)
	ON DELETE CASCADE
);
CREATE TABLE feed_follows (
	id UUID PRIMARY KEY,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL,
	user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
	feed_id UUID NOT NULL REFERENCES feeds(id) ON DELETE CASCADE,
	UNIQUE (user_id, feed_id)
);

-- +goose Down
DROP TABLE follow_feeds;

DROP TABLE feed;
