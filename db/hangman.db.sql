
CREATE TABLE games (
                id INT AUTO_INCREMENT NOT NULL,
                word VARCHAR(255),
                guesses VARCHAR(255),
                created_at DATETIME NOT NULL,
                updated_at DATETIME NOT NULL,
                name VARCHAR(255),
                status VARCHAR(255),
                PRIMARY KEY (id)
);


CREATE TABLE words (
                id INT AUTO_INCREMENT NOT NULL,
                created_at DATETIME NOT NULL,
                updated_at DATETIME NOT NULL,
                PRIMARY KEY (id)
);
