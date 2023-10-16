create database travelProject

use travelProject

-- Creating table for employee

CREATE TABLE Employee (
    EmployeeID int primary key identity(1,1),
	FirstName varchar(20),
    LastName varchar(20),
	Contact varchar(10),
    Dept varchar(20),
	Address varchar(20),
	DOB date,
);


select * from Employee
 
 -- Creating table for travelRequest

CREATE TABLE TravelRequest (
    RequestID int primary key identity(1,1),
	EmployeeID int foreign key REFERENCES Employee(EmployeeID),
    fromDestination varchar(20),
	toDestination varchar(20),
	Date date,
	status varchar(10));

	drop table TravelRequest

	select * from Employee;

	select * from TravelRequest;

	

select * from Employee;
select * from TravelRequest;

-- Creating stored procedure for insert employee data

create procedure insertEmployee 
   @FirstName varchar(50),
   @LastName varchar(50),
   @Contact varchar(50),
   @Dept varchar(50),
   @Address varchar(50),
   @DOB date
   as 
   begin
     insert into Employee(FirstName,LastName,Contact,Dept,Address,DOB)
	 values(@FirstName,@LastName,@Contact,@Dept,@Address,@DOB)
  end;

  exec insertEmployee 'Kalyani','Garkade',7666196089,'CSE','Hinjewadi Pune','2001-10-02';
   exec insertEmployee 'Divya','PAtil',76644332,'IT','Pimpari Pune','2001-12-18';
    exec insertEmployee 'Shruti','Pathi',907645478,'AIDS','Hyderabad','2001-05-10';


  -- To view all the data
create or alter procedure sp_viewEmp
as
begin
	select *from Employee
end

exec sp_viewEmp;


drop procedure insertTravelRequest

 --- Creating stored procedure for inserting travel request
  create or alter procedure insertTravelRequest
  @EmpID int,
   @fromDestination varchar(50),
   @toDestination varchar(50),
   @Date date,
   @status varchar(50)
   as 
   begin
     insert into TravelRequest(EmployeeID,fromDestination,toDestination,Date,status)
	 values(@EmpID,@fromDestination,@toDestination,@Date,@status)
  end;

  exec insertTravelRequest 1,'Pune','Nagpur','2023-10-20','open';
  exec insertTravelRequest 3,'Pune','Canada','2023-10-20','closed';

  -- stored procedute to Edit employee data
    create or alter procedure editEmployee
	@EmpID int,
	 @NewFirstName varchar(50),
   @NewLastName varchar(50),
   @NewContact varchar(50),
   @NewDept varchar(50),
   @NewAddress varchar(50),
   @NewDOB date
	as
	begin
	  update Employee
	  set FirstName= @NewFirstName ,
   LastName=@NewLastName ,
  Contact= @NewContact ,
   Dept= @NewDept ,
   Address = @NewAddress ,
  DOB= @NewDOB
  where EmployeeID=@EmpID;
  end

  -- stored procedute to  Delete employee data

create or alter procedure sp_deleteEmp(@emp_id int)
as 
begin
delete from employee where EmployeeID=@emp_id
end

exec sp_deleteEmp 2;

-- stored procedure to  Edit travel request
 create or alter procedure editTravelRequest
	@RequestID int,
	  @NewfromDestination varchar(50),
   @NewtoDestination varchar(50),
   @NewDate date,
   @Newstatus varchar(50)
	as
	begin
	  update TravelRequest
	  set fromDestination= @NewfromDestination ,
   toDestination=@NewtoDestination,
  Date= @NewDate ,
   status= @Newstatus 

  where RequestID=@RequestID;
  end


  -- stored procedure to delete travel request
  create or alter procedure sp_deleteTravelRequest(@requestID int)
as 
begin
delete from TravelRequest where RequestID=@requestID
end

-- stored procedure to approve travel request

-- stored procedure to view all request

create or alter procedure sp_viewTravelRequest
as
begin
	select *from TravelRequest
end

exec sp_viewTravelRequest

-- stored procedure to view open travel request
create or alter procedure sp_viewOTravelRequest
as
begin
	select *from TravelRequest
	where status='open';
end

-- stored procedure to view closed travel request

create or alter procedure sp_viewCTravelRequest
as
begin
	select *from TravelRequest
	where status='closed';
end