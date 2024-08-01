CREATE TABLE category(
        category_id  VARCHAR(5) NOT NULL PRIMARY KEY,
	category     VARCHAR(40)
	);


CREATE TABLE subcategory(
	subcategory_id  VARCHAR(10) NOT NULL PRIMARY KEY,
	subcategory  VARCHAR(60)
	);


CREATE TABLE contacts_cleaned(
	contact_id  INT NOT NULL PRIMARY KEY,
	first_name  VARCHAR(40),
	last_name   VARCHAR(40),
	email       VARCHAR(255)
	);

CREATE TABLE campaign(
	cf_id   INT NOT NULL PRIMARY KEY,
	contact_id INT NOT NULL,
	company_name    VARCHAR(255),
	description  VARCHAR(255),
	goal   DECIMAL (10,2) ,
	pledged   DECIMAL (10,2),
	outcome VARCHAR(20),
	backers_count INT,
	country  VARCHAR(5),
	currency  VARCHAR(5),
	launched_date    DATE,
	end_date         DATE,
	category_id     VARCHAR(5) NOT NULL,
	subcategory_id  VARCHAR(15) NOT NULL,
	FOREIGN KEY(category_id) REFERENCES category(category_id),
	FOREIGN KEY(subcategory_id) REFERENCES subcategory(subcategory_id),
	FOREIGN KEY(contact_id) REFERENCES contacts_cleaned(contact_id)
	);




---Verifying that the table were created with correct column names and data types and length

select column_name, data_type, character_maximum_length from information_schema.columns where table_name='category';
select column_name, data_type, character_maximum_length from information_schema.columns where table_name='subcategory';
select column_name, data_type, character_maximum_length from information_schema.columns where table_name='contacts_cleaned';
select column_name, data_type, character_maximum_length from information_schema.columns where table_name='campaign';

---Alternatively this can be achived by running select * from 'table_name'  and it will show 
---an empty structure of the table
	

--After the data is imported, verifying that the tables are populated:
select * from category;
select * from subcategory;
select * from contacts_cleaned;
select * from campaign;
