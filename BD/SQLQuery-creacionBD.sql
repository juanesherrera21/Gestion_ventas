CREATE DATABASE BikeStore
CREATE TABLE products
(
  product_id int identity (1,1) primary key,
  product_name varchar (200) NOT NULL,
  model_year smallint NOT NULL,
  price decimal (10, 2) NOT NULL
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
  order_id int identity (1,1) primary key,
  customer_id int not null,
  order_date date not null,
  constraint FK_Customer foreign key (customer_id) references customers(customer_id)
);
CREATE TABLE order_items
(
  order_item_id int identity (1,1) primary key,
  order_id int not null,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL (10, 2) NOT NULL,
  discount DECIMAL (4, 2) NOT NULL DEFAULT 0,
  constraint fk_Order foreign key (order_id) references orders(order_id),
  constraint fk_Product foreign key (product_id) references products(product_id)
);
