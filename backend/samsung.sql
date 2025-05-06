DROP DATABASE IF EXISTS samsung_products;
CREATE DATABASE samsung_products;

USE samsung_products;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    rating FLOAT DEFAULT 0,
    price DECIMAL(10, 2) NOT NULL,
    color VARCHAR(50),
    memory VARCHAR(50),
    ram VARCHAR(50),
    image VARCHAR(255) NOT NULL
);

INSERT INTO products (name, rating, price, color, memory, ram, image) VALUES
('Galaxy S25 Ultra', 4.9, 37490000, 'Black', '512GB', '12GB', 'galaxy_s25_ultra.avif'),
('Galaxy Z Fold5 (Special)', 4.8, 86500000, 'Special', '512GB', '12GB', 'galaxy_zflop5.avif'),
('Galaxy Z Fold6', 4.6, 39900000, 'Gray', '256GB', '12GB', 'galaxy_z_fold6.avif'),
('Galaxy Z Flip6', 4.5, 22900000, 'Black', '512GB', '12GB', 'galaxy_z_flip6.avif'),
('Galaxy S25+', 4.5, 30490000, 'Blue', '256GB', '8GB', 'galaxy_s25+.avif'),
('Galaxy S25', 4.3, 24990000, 'Blue', '128GB', '8GB', 'galaxy_s25.avif'),
('Galaxy S24 FE', 5.0, 16990000, 'Graphite', '256GB', '8GB', 'galaxy_s24_fe.avif'),
('Galaxy S24 Ultra', 4.7, 35990000, 'Titanium Gray', '512GB', '12GB', 'galaxy_s24_ultra.webp'),
('Galaxy A26', 4.1, 6390000, 'Navy Blue', '128GB', '6GB', 'galaxy_a26.webp'),
('Galaxy A56', 4.2, 9490000, 'Silver', '128GB', '6GB', 'galaxy_a56.webp');
