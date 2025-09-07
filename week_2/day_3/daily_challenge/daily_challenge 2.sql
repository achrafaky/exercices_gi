-- =====================================================
-- PART I : Orders & Items (1:N relationship)
-- =====================================================

DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS product_orders;

-- 1. Create product_orders table
CREATE TABLE product_orders (
    order_id SERIAL PRIMARY KEY,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create items table (each item belongs to one order)
CREATE TABLE items (
    item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    price NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    CONSTRAINT fk_order FOREIGN KEY (order_id)
        REFERENCES product_orders(order_id)
        ON DELETE CASCADE
);

-- 3. Insert sample orders
INSERT INTO product_orders DEFAULT VALUES; -- order 1
INSERT INTO product_orders DEFAULT VALUES; -- order 2

-- 4. Insert sample items
INSERT INTO items (order_id, item_name, price) VALUES
(1, 'Laptop', 1200.50),
(1, 'Mouse', 25.99),
(1, 'Keyboard', 75.00),
(2, 'Smartphone', 650.00),
(2, 'Headphones', 120.00);

-- -------------------
-- FUNCTION : total price for a given order
-- -------------------
CREATE OR REPLACE FUNCTION get_order_total(orderId INT)
RETURNS NUMERIC AS $$
DECLARE
    total NUMERIC(10,2);
BEGIN
    SELECT COALESCE(SUM(price), 0) INTO total
    FROM items
    WHERE order_id = orderId;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- Example usage:
SELECT get_order_total(1) AS order1_total; -- Laptop+Mouse+Keyboard
SELECT get_order_total(2) AS order2_total;


-- =====================================================
-- PART II : Users & Orders (1:N relationship)
-- =====================================================

DROP TABLE IF EXISTS users CASCADE;

-- 1. Create users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL
);

-- 2. Add user_id in product_orders
ALTER TABLE product_orders
ADD COLUMN user_id INT;

ALTER TABLE product_orders
ADD CONSTRAINT fk_user FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON DELETE CASCADE;

-- 3. Insert sample users
INSERT INTO users (username) VALUES ('Achraf'), ('Lea');

-- 4. Update existing orders to assign them to users
UPDATE product_orders SET user_id = 1 WHERE order_id = 1; -- Achraf
UPDATE product_orders SET user_id = 2 WHERE order_id = 2; -- Lea

-- -------------------
-- FUNCTION : total price for a given order of a given user
-- -------------------
CREATE OR REPLACE FUNCTION get_user_order_total(uId INT, oId INT)
RETURNS NUMERIC AS $$
DECLARE
    total NUMERIC(10,2);
BEGIN
    SELECT COALESCE(SUM(i.price), 0) INTO total
    FROM items i
    JOIN product_orders o ON i.order_id = o.order_id
    WHERE o.order_id = oId AND o.user_id = uId;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- Example usage:
SELECT get_user_order_total(1, 1) AS achraf_order1_total;
SELECT get_user_order_total(2, 2) AS lea_order2_total;
