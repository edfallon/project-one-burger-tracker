DROP TABLE burgers;
DROP TABLE restaurants;


CREATE TABLE restaurants(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);



CREATE TABLE burgers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  restaurant INT REFERENCES restaurants(id)
);
