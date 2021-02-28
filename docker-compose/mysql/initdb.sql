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
('Иван', 'Иванов', 1000, 'Gold'),
('Петр', 'Петров', 5, 'Silver'),
('Samuel L.', 'Jackson', 100000, 'Platinum'),
('Denzel', 'Washington', 10001, 'Gold'),
('John', 'Travolta', 0, 'Gold'),
('Сид', 'Сидоров', 456, 'Platinum'),
('Оби-Ван', 'Кеноби', 9999, 'Silver'),
('Джордж', 'Лукас', 789, 'Gold');