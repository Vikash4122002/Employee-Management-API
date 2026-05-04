-- Create database (if not already created)
CREATE DATABASE IF NOT EXISTS employee_db;
USE employee_db;

-- Drop existing table if needed (for fresh start)
DROP TABLE IF EXISTS employees;

-- Create employees table
CREATE TABLE employees (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50)     NOT NULL,
    last_name   VARCHAR(50)     NOT NULL,
    email       VARCHAR(100)    UNIQUE NOT NULL,
    department  VARCHAR(50),
    salary      DECIMAL(10, 2),
    hire_date   DATE,
    created_at  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,
    updated_at  TIMESTAMP       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample employees
INSERT INTO employees (first_name, last_name, email, department, salary, hire_date)
VALUES
    ('John',  'Doe',     'john.doe@example.com',     'Engineering', 75000.00, '2023-01-15'),
    ('Jane',  'Smith',   'jane.smith@example.com',   'Marketing',   68000.00, '2022-11-01'),
    ('Alice', 'Johnson', 'alice.johnson@example.com','Sales',        72000.00, '2023-06-20');
