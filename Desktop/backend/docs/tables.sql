CREATE TABLE users (
    id serial PRIMARY KEY,
    hash varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    register_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    plan int NOT NULL,
    coins int NOT NULL
);

CREATE TABLE payments (
    id serial PRIMARY KEY,
    user int NOT NULL,
    title varchar(255) NOT NULL,
    price int NOT NULL,
    date datetime NOT NULL DEFAULT GETDATE(),
    PRIMARY KEY (ID),
    FOREIGN KEY (user) REFERENCES users(id)
);

CREATE TABLE global_notifications (
    id serial PRIMARY KEY,
    title varchar(2000) NOT NULL,
    message varchar(2000) NOT NULL,
    date date NOT NULL,
    PRIMARY KEY (ID)
);
