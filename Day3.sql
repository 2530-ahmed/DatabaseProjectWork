-- Database Setup
CREATE DATABASE UserRoleManagement;
USE UserRoleManagement;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);
INSERT INTO employees (name, position, salary)
VALUES ('Alice', 'Manager', 75000.00),
       ('Bob', 'Developer', 55000.00),
       ('Charlie', 'Designer', 45000.00);


-- Creating Roles
CREATE ROLE 'admin_role';
GRANT ALL PRIVILEGES ON UserRoleManagement.* TO 'admin_role' WITH GRANT OPTION;
CREATE ROLE 'readonly_role';
GRANT SELECT ON UserRoleManagement.* TO 'readonly_role';
CREATE ROLE 'poweruser_role';
GRANT SELECT, INSERT ON UserRoleManagement.* TO 'poweruser_role';

-- Assigning Roles to Users
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_user_password';
CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'readonly_user_password';
CREATE USER 'poweruser_user'@'localhost' IDENTIFIED BY 'poweruser_user_password';
GRANT 'admin_role' TO 'admin_user'@'localhost';
GRANT 'readonly_role' TO 'readonly_user'@'localhost';
GRANT 'poweruser_role' TO 'poweruser_user'@'localhost';


-- Testing Permissions
SELECT * FROM employees; -- Worked
INSERT INTO employees (name, position, salary) VALUES ('Diana', 'Tester', 40000.00); -- Worked
DELETE FROM employees WHERE name = 'Diana'; -- Worked
SELECT * FROM employees; -- Worked
INSERT INTO employees (name, position, salary) VALUES ('Eve', 'Intern', 20000.00); -- Failed
DELETE FROM employees WHERE name = 'Alice'; -- Failed
SELECT * FROM employees; -- Worked
INSERT INTO employees (name, position, salary) VALUES ('Frank', 'Analyst', 50000.00); -- Worked
DELETE FROM employees WHERE name = 'Frank'; -- Failed

