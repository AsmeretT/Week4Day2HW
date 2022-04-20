CREATE TABLE "customer" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "email_address" VARCHAR(50),
  "address" VARCHAR(100),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "tickets" (
  "ticket_number" SERIAL,
  "customer_id" INTEGER,
  "ticket_date" DATE,
  "movie_id" INTEGER,
  "ticket_price" NUMERIC(5,2),
  PRIMARY KEY ("ticket_number"),
  CONSTRAINT "FK_tickets.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id")
  CONSTRAINT "FK_tickets.movie_id"
      FOREIGN KEY ("movie_id")
      	REFERENCES "movies"("movie_id")
);

CREATE TABLE "movies" (
  "movie_id" INTEGER,
  "movie_title" VARCHAR(150),
  "movie_showtime" TIME,
  "movie_rating" VARCHAR(10),
  PRIMARY KEY ("movie_id"),
  CONSTRAINT "FK_movies.movie_id"
    FOREIGN KEY ("movie_id")
      REFERENCES "tickets"("movie_id")
);

CREATE TABLE "concessions_inventory" (
  "item_number" INTEGER,
  "item_quantity" INTEGER,
  PRIMARY KEY ("item_number")
);

CREATE TABLE "concessions" (
  "order_number" SERIAL,
  "order_date" DATE,
  "total_price" NUMERIC(5,2),
  "customer_id" INTEGER,
  "item_number" INTEGER,
  PRIMARY KEY ("order_number"),
  CONSTRAINT "FK_concessions.customer_id"
    FOREIGN KEY ("customer_id")
      REFERENCES "customer"("customer_id")
);


