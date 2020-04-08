
DROP TABLE SALARY_NEW

CREATE TABLE SALARY_NEW
(
	EmpID INT,
	Designation VARCHAR(50),
	JobLevel VARCHAR(50),
	GrossPay INT,
	Experience INT,
	LastUpdated DATE
);

SELECT * FROM Salary_new;

ALTER TABLE SALARY_NEW 
ADD FOREIGN KEY(EmpID) REFERENCES Employee(EmpId)

DROP TABLE dbo.employee


create table employee (
	EmpID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	Gender VARCHAR(50),
	DOB DATE,
	DOJ DATE,
	Mobile VARCHAR(50),
	Address VARCHAR(50),
	LastLogin VARCHAR(50),
	IsActive BIT
);

insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Torrance', 'Gardiner', 'Male', '21-Apr-1926', '7/28/2019', '9782187692', '599 Cardinal Parkway', '4:28 AM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Verna', 'Hirche', 'Female', '25-Apr-1982', '9/25/2019', '2969189830', '12 Hoepker Hill', '4:18 AM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Glenden', 'Challenor', 'Male', '12-Apr-1921', '5/25/2019', '9684398700', '6 Atwood Terrace', '10:56 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Celestina', 'Sellek', 'Female', '18-Jun-1897', '3/3/2020', '9218575870', '7 Colorado Court', '1:04 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Farris', 'Trunby', 'Male', '02-Jul-1985', '1/11/2020', '3212576877', '9 Packers Hill', '5:05 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Brooks', 'Tregona', 'Female', '10-Nov-1935', '5/14/2019', '8274116579', '22593 Doe Crossing Pass', '10:42 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Alessandra', 'Burrows', 'Female', '13-Oct-1936', '9/1/2019', '3278619017', '9410 Oriole Circle', '1:39 AM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Dacey', 'Jonsson', 'Female', '17-Apr-1898', '11/11/2019', '4364333954', '8277 Florence Plaza', '1:39 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Hamlin', 'MacCarter', 'Male', '06-Dec-1981', '11/19/2019', '3214163513', '14 Tomscot Plaza', '7:04 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Janot', 'Deane', 'Female', '22-Oct-1956', '1/28/2020', '6695969120', '56822 Schiller Street', '10:02 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Vernon', 'Canning', 'Male', '21-Dec-1999', '2/23/2020', '9097407508', '5 Elka Terrace', '12:24 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Hadleigh', 'McGlaughn', 'Male', '13-Jan-1910', '1/23/2020', '7841436783', '06994 Bluestem Parkway', '6:08 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Larissa', 'Stentiford', 'Female', '19-Oct-1899', '11/30/2019', '2369612266', '99828 Bunting Alley', '1:30 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Fremont', 'Watkin', 'Male', '19-Jan-1927', '2/18/2020', '4393907419', '4 Dawn Point', '12:57 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Jayme', 'Ridsdale', 'Female', '11-Mar-1966', '2/19/2020', '5776462909', '97095 Oneill Pass', '5:16 AM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Berrie', 'Enderlein', 'Female', '06-Jun-1902', '3/3/2020', '3042171999', '37 Eggendart Plaza', '7:43 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Kelley', 'Mattingson', 'Female', '02-Nov-1928', '3/25/2019', '4381099933', '0 Lillian Point', '8:03 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Modestine', 'Hadcroft', 'Female', '09-Feb-1942', '11/18/2019', '3616774540', '6004 Pleasure Lane', '12:17 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Bondie', 'Creeber', 'Male', '07-Jul-2012', '10/29/2019', '9701240774', '0 Waxwing Junction', '10:04 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Eldredge', 'Lawranson', 'Male', '23-Jun-1954', '12/7/2019', '3051893555', '1537 Nancy Park', '2:04 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Ruth', 'Patry', 'Female', '19-Jan-1906', '3/2/2020', '1511787089', '5391 Ridge Oak Crossing', '8:01 AM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Chandra', 'Playhill', 'Female', '08-Jun-1981', '4/24/2019', '1863665700', '7189 Derek Center', '3:08 AM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Ozzy', 'Adney', 'Male', '01-Mar-1995', '11/17/2019', '5071152277', '6634 Menomonie Court', '12:45 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Egon', 'Digance', 'Male', '31-Jan-1939', '2/6/2020', '1466987932', '98116 Mallory Crossing', '4:05 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Gerti', 'Snuggs', 'Female', '12-Jun-2015', '7/26/2019', '7216399602', '4 Montana Drive', '2:01 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Karlis', 'Milroy', 'Male', '22-May-1944', '5/8/2019', '9174644922', '2 Sutteridge Junction', '2:38 AM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Fulvia', 'Greatham', 'Female', '03-Dec-1955', '8/3/2019', '9481567657', '3 Colorado Court', '8:55 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Cecilio', 'Magarrell', 'Male', '29-Sep-1963', '7/26/2019', '2236772112', '2 Myrtle Street', '6:51 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Neel', 'Clougher', 'Male', '27-Sep-1996', '11/14/2019', '7722957507', '946 Oneill Drive', '4:33 AM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Myrvyn', 'Pittock', 'Male', '14-Jun-1924', '8/18/2019', '4301760235', '8215 Florence Drive', '7:44 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Kirsteni', 'McNern', 'Female', '25-Feb-1965', '8/22/2019', '7128705993', '905 Upham Street', '5:12 AM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Val', 'Naptine', 'Female', '21-Nov-2001', '6/14/2019', '4432054835', '17 Hallows Crossing', '6:35 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Krishna', 'Blanpein', 'Male', '02-Nov-1981', '12/30/2019', '3969604621', '189 Westport Avenue', '12:49 AM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Conny', 'Lyste', 'Female', '20-Feb-1984', '6/6/2019', '9978350115', '8 Gerald Parkway', '11:37 AM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Ag', 'Raggles', 'Female', '19-Apr-1917', '11/29/2019', '8663733589', '08 Shoshone Center', '12:09 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Anthia', 'Berdale', 'Female', '04-Jul-2005', '5/23/2019', '3015570084', '1043 Pepper Wood Crossing', '1:14 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Marianne', 'Wiffill', 'Female', '09-Jan-1945', '9/27/2019', '5757610165', '73 Maple Wood Drive', '6:13 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Nicola', 'Constantine', 'Male', '26-Mar-1987', '2/6/2020', '3059579664', '9507 Montana Parkway', '12:28 AM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Allene', 'McCane', 'Female', '10-Sep-1914', '9/22/2019', '3272969978', '4425 Sunbrook Place', '8:37 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Conan', 'Pithie', 'Male', '01-Jan-1970', '4/26/2019', '1537002121', '95 Fairfield Street', '3:23 AM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Charo', 'Harlow', 'Female', '29-Oct-2002', '1/25/2020', '8981348590', '36149 Green Ridge Junction', '11:22 AM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Malissa', 'Tetla', 'Female', '09-Jan-1946', '6/17/2019', '9078187352', '073 Forest Run Center', '11:27 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Astrid', 'Meritt', 'Female', '20-Oct-1977', '10/26/2019', '5794969922', '48 Iowa Terrace', '6:42 AM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Avram', 'Skamal', 'Male', '06-Jul-1951', '2/14/2020', '4158578889', '9 Heath Street', '6:43 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Loraine', 'Cyples', 'Female', '20-Dec-1948', '2/16/2020', '7456078960', '15354 Lakewood Pass', '4:06 PM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Janessa', 'Thairs', 'Female', '10-May-1999', '12/31/2019', '2135489243', '32623 Ohio Pass', '6:10 PM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Catarina', 'Guiso', 'Female', '16-Nov-1931', '3/25/2019', '5087439433', '6630 Talmadge Lane', '3:20 AM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Josiah', 'Zapater', 'Male', '06-Jun-1912', '11/19/2019', '8809474520', '7 Arrowood Terrace', '12:06 AM', 1);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Ailey', 'Belverstone', 'Female', '04-Aug-2012', '8/1/2019', '5516636176', '48356 Northwestern Pass', '12:21 AM', 0);
insert into employee (FirstName, LastName, Gender, DOB, DOJ, Mobile, Address, LastLogin, IsActive) values ('Essie', 'Clare', 'Female', '23-Sep-1996', '9/21/2019', '7543478753', '2052 Bonner Lane', '2:33 AM', 1);
