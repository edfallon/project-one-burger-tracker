DROP TABLE burger_deals;
DROP TABLE deals;
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


CREATE TABLE deals(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  day VARCHAR(255)
);

CREATE TABLE burger_deals(
  id SERIAL PRIMARY KEY,
  deal_id INT REFERENCES deals(id),
  burger_id INT REFERENCES burgers(id)

);
