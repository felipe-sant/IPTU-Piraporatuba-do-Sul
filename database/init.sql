CREATE TABLE
    IF NOT EXISTS test (
        id SERIAL PRIMARY KEY,
        string TEXT NOT NULL,
        number INTEGER NOT NULL
    );