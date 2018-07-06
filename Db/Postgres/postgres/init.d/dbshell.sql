CREATE SCHEMA records;
SET search_path TO records;

CREATE TABLE customers (
    customer_id integer NOT NULL,
    firstname   varchar(50) NOT NULL,
    surname     varchar(100) NOT NULL,
    age         integer NOT NULL,
    PRIMARY KEY(customer_id)
);

INSERT INTO customers(customer_id, firstname, surname, age) VALUES (1, 'peter', 'pan', 19);
INSERT INTO customers(customer_id, firstname, surname, age) VALUES (2, 'John', 'smith', 21);
INSERT INTO customers(customer_id, firstname, surname, age) VALUES (3, 'james', 'Down', 22);
