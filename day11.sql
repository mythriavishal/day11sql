use day11sql;
CREATE TABLE Company (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(100),
    location VARCHAR(100),
    revenue DECIMAL(15,2),
    employee_count INT,
    founded_year INT
);

DELIMITER //

CREATE PROCEDURE InsertCompany(
    IN cname VARCHAR(100),
    IN clocation VARCHAR(100),
    IN crevenue DECIMAL(15,2),
    IN emp_count INT,
    IN year_founded INT
)
BEGIN
    INSERT INTO Company(company_name, location, revenue, employee_count, founded_year)
    VALUES (cname, clocation, crevenue, emp_count, year_founded);
END //

DELIMITER ;

CALL InsertCompany('TCS', 'Chennai', 5000000, 10000, 1995);
CALL InsertCompany('Accenture','Bangalore','6000000',5000,2000);

select * from company;

DELIMITER //

CREATE PROCEDURE GetAllCompanies()
BEGIN
    SELECT * FROM Company;
END //

DELIMITER ;

CALL GetAllCompanies();

DELIMITER //

CREATE PROCEDURE GetCompanyByLocation(
    IN clocation VARCHAR(100)
)
BEGIN
    SELECT * FROM Company
    WHERE location = clocation;
END //

DELIMITER ;

CALL GetCompanyByLocation('Chennai');
CALL GetCompanyByLocation('Bangalore');

