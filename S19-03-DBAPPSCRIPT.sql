-- ------------------------------------------------------------------------
-- PC RENTAL SCHEMA
-- ------------------------------------------------------------------------
DROP SCHEMA IF EXISTS pcRental;
CREATE SCHEMA IF NOT EXISTS pcRental;
USE pcRental;

-- core data record 1
DROP TABLE IF EXISTS pc_information;
CREATE TABLE IF NOT EXISTS pc_information (
    pc_id INT(5) AUTO_INCREMENT,
    PRIMARY KEY (pc_id),
    pc_type VARCHAR(150) NOT NULL,
    latest_username VARCHAR(20) NULL, -- allowed NULL because the PC may have not been used yet
    last_maintenance_date DATETIME NULL, -- allowed NULL because the PC may have not been maintained yet
    pc_status ENUM('IN-USE', 'AVAILABLE', 'IN-MAINTENANCE')
);

-- core data record 2
DROP TABLE IF EXISTS user_information;
CREATE TABLE IF NOT EXISTS user_information(
	user_id INT(5) AUTO_INCREMENT,
    PRIMARY KEY (user_id),
    last_name VARCHAR(150) NOT NULL,
    first_name VARCHAR(150) NOT NULL,
    contact_number VARCHAR(150) NOT NULL,
    username VARCHAR(150) NOT NULL UNIQUE,
    user_password VARCHAR(150) NOT NULL,
    account_balance DECIMAL(6, 2) NOT NULL
);

-- core data record 3
DROP TABLE IF EXISTS pc_maintenanceinfo;
CREATE TABLE IF NOT EXISTS pc_maintenanceinfo(
    maintenance_id INT(5) AUTO_INCREMENT,
    PRIMARY KEY (maintenance_id),
    pc_id INT(5), 
	FOREIGN KEY (pc_id) REFERENCES pc_information(pc_id),
	maintenance_status ENUM('PENDING', 'COMPLETE') NOT NULL,
	maintenance_date DATETIME NOT NULL,
	repair_companyname VARCHAR(150) NULL
);

-- core data record 4 fixed: divided transactions into two tables
DROP TABLE IF EXISTS rental_transaction;
CREATE TABLE IF NOT EXISTS rental_transaction (
	rentaltransaction_id INT(5) AUTO_INCREMENT,
    PRIMARY KEY (rentaltransaction_id),
    rental_date DATETIME,
    user_id INT(5),
    FOREIGN KEY (user_id) REFERENCES user_information(user_id),
    pc_id INT(5),
    FOREIGN KEY (pc_id) REFERENCES pc_information(pc_id),
    hours_spent FLOAT
);

DROP TABLE IF EXISTS user_topup;
CREATE TABLE IF NOT EXISTS user_topup (
	topup_id INT(5) AUTO_INCREMENT,
    PRIMARY KEY (topup_id),
	user_id INT(5),
    FOREIGN KEY (user_id) REFERENCES user_information(user_id),
    topup_date DATETIME,
    amount FLOAT,
    payment_method ENUM('CASH', 'GCASH', 'PAYMAYA', 'CARD')
);

-- ------------------------------------------------------------------------
-- SAMPLE DATA
-- ------------------------------------------------------------------------
-- report 1: display of user activities (user_information + user_topup + rental_transaction)
-- report 2: yearly and monthly report of all invoices related to a pc (pc_information + rental_transaction + pc_maintenanceinfo)
-- DATETIME is YYYY-MM-DD HH:MM
-- assume last maintenance of PC was during creation of database 2023-04-01 10:00

INSERT INTO pc_information (pc_type, latest_username, last_maintenance_date, pc_status)
VALUES 
('REGULAR', 'janesmith456', '2023-04-01 10:00', 'AVAILABLE'),         -- pc 1 REGULAR
('VIP', 'janesmith456', '2023-04-01 10:00', 'AVAILABLE'),                -- pc 2 VIP
('REGULAR', 'AdminUser', '2023-04-01 10:00', 'AVAILABLE'),         -- pc 3 REGULAR
('VIP', 'robjohnson789', '2023-04-01 10:00', 'AVAILABLE'),                -- pc 4 VIP
('REGULAR', NULL, '2023-04-01 10:00', 'AVAILABLE');         -- pc 5 REGULAR

INSERT INTO user_information (last_name, first_name, contact_number, username, user_password, account_balance)
VALUES 
('Adminson', 'Admin', '0911-111-1111', 'AdminUser', 'secureAdminPass', 120.00),    -- user 1
('Doe', 'John', '1234-567-8910', 'johndoe123', 'password', 270.00),        -- user 2
('Smith', 'Jane', '987-654-3210', 'janesmith456', 'strongPassword', 0),       -- user 3
('Johnson', 'Robert', '555-123-4567', 'robjohnson789', 'safePass123', 40),     -- user 4
('Richman','Rich', '0917-666-6666', 'superRichGuy666', 'ILoveMoney', 9999.99),      -- user 5
('McDonald', 'Ronald', '0917-555-1234', 'RonaldMcDo', 'GoldenArch123', 0),    -- user 6
('Bee', 'Jolli', '0922-888-5678', 'JolliBeeOfficial', 'Yumburger123', 0);     -- user 7

INSERT INTO pc_maintenanceinfo (pc_id, maintenance_status, maintenance_date, repair_companyname)
VALUES 
(1, 'COMPLETE', '2023-04-05 13:45', 'TechRepairs Inc.'),
(2, 'COMPLETE', '2023-04-01 10:00', 'TechREpairs Inc.'),
(3, 'COMPLETE', '2023-04-05 13:45', 'TechRepairs Inc.'),
(4, 'COMPLETE', '2023-04-05 13:45', 'TechRepairs Inc.'),
(5, 'COMPLETE', '2023-04-05 13:45', 'TechRepairs Inc.');
-- examples: TechRepairs Inc., FixIt Solutions, PCExperts

INSERT INTO user_topup (user_id, topup_date, amount, payment_method)
VALUES 
(1, '2023-04-03 07:00', 100.00, 'CASH'), -- user 1 top up 100.00
(1, '2023-04-03 09:00', 80.00, 'CASH'), -- user 1 top up 80.00 after using PC 3
(2, '2023-04-03 12:00', 300.00, 'PAYMAYA'), -- user 2 top up 300.00
(3, '2023-04-04 13:00', 150.00, 'GCASH'), -- user 3 top up 100.00
(3, '2023-04-04 16:00', 80.00, 'GCASH'), -- user 3 top up 80 after using PC 2
(4, '2023-04-06 8:00', 120.00, 'PAYMAYA'), -- user 4 top up 120  
(5, '2023-04-06 3:00', 9999.99, 'GCASH'); -- user 5 top up 9999.99

INSERT INTO rental_transaction (rental_date, user_id, pc_id, hours_spent)
VALUES 
('2023-04-03 09:00', 1, 3, 2.0), -- user 1 uses pc 3 for 2.0 hours
('2023-04-03 1:00', 2, 1, 1.0), -- user 2 uses pc 1 for 1.0 hours
('2023-04-04 16:00', 3, 2, 3.0), -- user 3 uses pc 2 for 3.0 hours
('2023-04-04 20:00', 3, 1, 1.0), -- user 3 uses pc 1 for 1.0 hours
('2023-04-06 10:00', 4, 4, 2.0), -- user 4 uses pc 4 for 2.0 hours
('2023-11-21 21:58', 5, 5, 1.0);