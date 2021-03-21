CREATE PROC Sp_Employee
@Sr_no INT, @Emp_name NVARCHAR(500),
@City NVARCHAR(500), @State NVARCHAR(500),
@Country NVARCHAR(500), @Department NVARCHAR(500),
@flag NVARCHAR(50)
--Insert
AS	BEGIN
	IF(@flag = 'insert')
	BEGIN 
		INSERT INTO dbo.tbl_Employee
		        ( Emp_name ,
		          City ,
		          STATE ,
		          Country ,
		          Department ,
		          flag
		        )
		VALUES  (@Emp_name, @City, @State, @Country, @Department)
	END
-- Update 
	ELSE IF (@flag = 'update')
	BEGIN
		UPDATE dbo.tbl_Employee SET
		Emp_name = @Emp_name, City = @City, STATE = @State, 
		Country = @Country, Department = @Department
		WHERE Sr_no = @Sr_no
	END
-- Delete
	ELSE IF (@flag = 'delete')
	BEGIN
	    DELETE FROM dbo.tbl_Employee
		WHERE Sr_no = @Sr_no
	END
--Select
	ELSE IF(@flag = 'getid')
	BEGIN
	    SELECT * FROM dbo.tbl_Employee
		WHERE Sr_no = @Sr_no
	END

	ELSE IF(@flag = 'get')
	BEGIN
	    SELECT * FROM dbo.tbl_Employee
	END
END