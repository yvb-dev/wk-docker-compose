DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    ID serial,
    FIRST_NAME varchar(100) NOT NULL,
    LAST_NAME  varchar(100) NOT NULL,
    BALANCE    numeric(15, 2) NOT NULL,
    TARIFF     varchar(100) NOT NULL,
    PRIMARY KEY (ID)
);

DELETE FROM users;

INSERT INTO users (FIRST_NAME, LAST_NAME, BALANCE, TARIFF) VALUES
('Jack', 'Nicholson', 5, 'Silver'),
('Samuel L.', 'Jackson', 100000, 'Platinum'),
('Denzel', 'Washington', 10001, 'Gold'),
('John', 'Travolta', 0, 'Gold'),
('Natalie', 'Portman', 1000, 'Gold'),
('Tom', 'Hanks', 456, 'Platinum'),
('Al', 'Pacino', 9999, 'Silver'),
('Dustin', 'Hoffman', 789, 'Gold');