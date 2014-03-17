CREATE TABLE access (
	id SERIAL,
	date TIMESTAMP,
	method VARCHAR(10),
	url VARCHAR(1024),
	url_prefix VARCHAR(255),
	status INTEGER,
	size INTEGER,
	time_ms INTEGER,
	referer VARCHAR(1024),
	ua VARCHAR(512)
);

CREATE INDEX ON access (status);
CREATE INDEX ON access (url_prefix);

