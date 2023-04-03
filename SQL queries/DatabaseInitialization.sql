use TestDigitalDesignBD;
create table Department(
	Id integer primary key identity(1,1),
	Name nvarchar(100)
);

create table Employee(
	Id integer primary key identity(1,1),
	Department_Id integer foreign key references Department(Id),
	Chief_Id integer foreign key references Employee(Id),
	Name nvarchar(100),
	Salary integer
);

insert into Department(Name) values
('Super Department'),('Some strange Department'),('Usual Department');

insert into Employee(Department_Id, Name, Salary) values (1,'Bogdan',700);

insert into Employee(Department_Id, Chief_Id, Name, Salary) values (1,1,'Никита', 500), (1,1,'Влад',600);

insert into Employee(Name, Salary) values ('Алексей',3200);

insert into Employee(Department_Id,Chief_Id, Name, Salary) values (2,2,'Иннокентий',1025);

insert into Employee(Department_Id, Chief_Id, Name, Salary) values (2,3,'Владлен', 959), (2,3,'Леонид',855);

insert into Employee(Department_Id,Chief_Id, Name, Salary) values (3,2,'Аркадий',1225);

insert into Employee(Department_Id, Chief_Id, Name, Salary) values (3,10,'Владимир', 780), (3,10,'Максим',360);

insert into Employee(Name,Salary) values ('Руслан',250);

Update Employee set Chief_Id=2 where Id=1