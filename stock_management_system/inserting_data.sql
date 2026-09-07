INSERT INTO categories (category_name, description, created_at, updated_at) VALUES ('Electronics', 'Devices, gadgets, and electronic components', TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'));
INSERT INTO categories (category_name, description, created_at, updated_at) VALUES ('Groceries', 'Daily food and consumable household items', TO_DATE('2024-01-18', 'YYYY-MM-DD'), TO_DATE('2024-02-05', 'YYYY-MM-DD'));
INSERT INTO categories (category_name, description, created_at, updated_at) VALUES ('Furniture', 'Office and home furniture items', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-10', 'YYYY-MM-DD'));
INSERT INTO categories (category_name, description, created_at, updated_at) VALUES ('Stationery', 'Office supplies and paper products', TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-15', 'YYYY-MM-DD'));
INSERT INTO categories (category_name, description, created_at, updated_at) VALUES ('Clothing', 'Apparel and wearable garments', TO_DATE('2024-02-20', 'YYYY-MM-DD'), TO_DATE('2024-02-25', 'YYYY-MM-DD'));
INSERT INTO categories (category_name, description, created_at, updated_at) VALUES ('Tools', 'Hardware and maintenance tools', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-05', 'YYYY-MM-DD'));
INSERT INTO categories (category_name, description, created_at, updated_at) VALUES ('Appliances', 'Large home and office appliances', TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-12', 'YYYY-MM-DD'));
INSERT INTO categories (category_name, description, created_at, updated_at) VALUES ('Automotive', 'Car parts and accessories', TO_DATE('2024-03-15', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'));
INSERT INTO categories (category_name, description, created_at, updated_at) VALUES ('Sports', 'Fitness and athletic gear', TO_DATE('2024-03-22', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'));
INSERT INTO categories (category_name, description, created_at, updated_at) VALUES ('Books', 'Educational and reference books', TO_DATE('2024-03-28', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'));

-- Don't forget to commit the changes so they are permanently saved!
COMMIT;

INSERT INTO suppliers (company_name, contact_person, phone, address) VALUES ('TechCorp Global', 'Alice Uwase', '+250788111222', 'Kigali');
INSERT INTO suppliers (company_name, contact_person, phone, address) VALUES ('Global Foods Ltd', 'Jean Bosco', '+250788333444', 'Butare');
INSERT INTO suppliers (company_name, contact_person, phone, address) VALUES ('Office Depot Rwanda', 'Clarisse Mukamana', '+250788555666', 'Kigali');
INSERT INTO suppliers (company_name, contact_person, phone, address) VALUES ('Prime Hardware', 'Eric Ndayisaba', '+250788777888', 'Gisenyi');
INSERT INTO suppliers (company_name, contact_person, phone, address) VALUES ('Fashion Hub', 'Diane Ingabire', '+250788999000', 'Kigali');
INSERT INTO suppliers (company_name, contact_person, phone, address) VALUES ('AutoZone Supplies', 'Patrick Mugabo', '+250788222333', 'Musanze');
INSERT INTO suppliers (company_name, contact_person, phone, address) VALUES ('Mega Appliances', 'Aline Cyusa', '+250788444555', 'Kigali');
INSERT INTO suppliers (company_name, contact_person, phone, address) VALUES ('Sports Gear Inc', 'Fiston Niyigena', '+250788666777', 'Huye');
INSERT INTO suppliers (company_name, contact_person, phone, address) VALUES ('Bookworm Publishers', 'Grace Uwimana', '+250788888999', 'Kigali');
INSERT INTO suppliers (company_name, contact_person, phone, address) VALUES ('Industrial Tools Ltd', 'Emmanuel Habimana', '+250788123456', 'Muhanga');

COMMIT;

INSERT INTO products (product_name, category_id, unit_price, quantity_in_stock) VALUES ('Smartphone', 1, 450.00, 25);
INSERT INTO products (product_name, category_id, unit_price, quantity_in_stock) VALUES ('Organic Rice 5kg', 2, 12.50, 100);
INSERT INTO products (product_name, category_id, unit_price, quantity_in_stock) VALUES ('Executive Office Chair', 3, 150.00, 15);
INSERT INTO products (product_name, category_id, unit_price, quantity_in_stock) VALUES ('A4 Printer Paper', 4, 6.00, 200);
INSERT INTO products (product_name, category_id, unit_price, quantity_in_stock) VALUES ('Cotton T-Shirt', 5, 15.00, 80);
INSERT INTO products (product_name, category_id, unit_price, quantity_in_stock) VALUES ('Cordless Power Drill', 6, 85.00, 30);
INSERT INTO products (product_name, category_id, unit_price, quantity_in_stock) VALUES ('Microwave Oven', 7, 120.00, 10);
INSERT INTO products (product_name, category_id, unit_price, quantity_in_stock) VALUES ('Synthetic Engine Oil', 8, 25.00, 50);
INSERT INTO products (product_name, category_id, unit_price, quantity_in_stock) VALUES ('Running Shoes', 9, 75.00, 40);
INSERT INTO products (product_name, category_id, unit_price, quantity_in_stock) VALUES ('Database Systems Textbook', 10, 55.00, 60);

COMMIT;

select * from PRODUCTS