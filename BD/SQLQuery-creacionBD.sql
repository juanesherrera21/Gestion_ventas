CREATE DATABASE BikeStore
CREATE TABLE products
(
  product_id INT IDENTITY (1,1) PRIMARY KEY,
  product_name VARCHAR (200) NOT NULL,
  model_year SMALLINT NOT NULL,
  price DECIMAL (10, 2) NOT NULL
);
CREATE TABLE customers (
  customer_id INT IDENTITY (1, 1) PRIMARY KEY,
  first_name VARCHAR (255) NOT NULL,
  last_name VARCHAR (255) NOT NULL,
  phone VARCHAR (25),
  email VARCHAR (255) NOT NULL,
  street VARCHAR (255),
  city VARCHAR (50),
  state VARCHAR (25),
  zip_code VARCHAR (5)
);
CREATE TABLE orders
(
  order_id INT IDENTITY (1,1) PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  CONSTRAINT FK_Customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items
(
  order_item_id INT IDENTITY (1,1) PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL (10, 2) NOT NULL,
  discount DECIMAL (4, 2) NOT NULL DEFAULT 0,
  CONSTRAINT fk_Order FOREIGN KEY (order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_Product FOREIGN KEY (product_id) REFERENCES products(product_id)
);
