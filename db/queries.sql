

SELECT u.id, u.full_name, r.name AS role
FROM users u
JOIN user_roles r ON r.id = u.role_id
WHERE u.email = '94d5ous@gmail.com'
  AND u.password = 'uzWC67';

SELECT t.id, t.sku, t.product_type_id, t.unit, t.price,
       t.discount_percent, t.stock_quantity, t.description,
       t.image_filename, c.name AS category,
       p.name AS manufacturer, s.name AS supplier
FROM products t
JOIN product_categories c ON c.id = t.category_id
JOIN manufacturers p ON p.id = t.manufacturer_id
JOIN suppliers s ON s.id = t.supplier_id
WHERE t.product_type_id = 1
  AND s.name LIKE '%Kari%'
ORDER BY t.discount_percent DESC;

SELECT id, name FROM product_categories;
SELECT id, name FROM manufacturers;
SELECT id, name FROM suppliers;

INSERT INTO products
(sku, product_type_id, unit, price, discount_percent, stock_quantity,
 description, image_filename, category_id, manufacturer_id, supplier_id)
VALUES
('H782T5', 2, 'шт.', 5000, 5, 8, 'мужские Ботинки демисезонные kari', '3.png', 2, 1, 1);

SELECT * FROM products WHERE id = 3;

UPDATE products
SET sku = 'F635R4',
    product_type_id = 1,
    unit = 'шт.',
    price = 4499,
    discount_percent = 4,
    stock_quantity = 4,
    description = '',
    image_filename = '',
    category_id = 2,
    manufacturer_id = 1,
    supplier_id = 1
WHERE id = 3;

SELECT COUNT(*) AS used_in_orders
FROM order_items
WHERE product_id = 1;

DELETE FROM products
WHERE id = 1;