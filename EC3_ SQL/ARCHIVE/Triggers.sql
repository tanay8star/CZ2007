USE [CZ2007_Lab_Assignment]
GO

CREATE TRIGGER RemovePreviousZip   
ON Person_Info   
AFTER UPDATE
AS DECLARE @NewAddress VARCHAR(50), @NewCity_name VARCHAR(50), @NewState_name VARCHAR(50), @OldAddress VARCHAR(50), @OldCity_name VARCHAR(50), @OldState_name VARCHAR(50);
SELECT @OldAddress = del."Address" FROM deleted del;
SELECT @OldCity_name = del.City_name FROM deleted del;
SELECT @OldState_name = del.State_name FROM deleted del;
SELECT @NewAddress = ins."Address" FROM inserted ins;
SELECT @NewCity_name = ins.City_name FROM inserted ins;
SELECT @NewState_name = ins.State_name FROM inserted ins;

/* Check whether columns 6, 7 or 8 have been updated. If any or all  
columns 6, 7 or 8 have been changed, create an audit record.
The bitmask is: power(2, (6-1)) + power(2, (7-1)) + power(2, (8-1)) = 224.
This bitmask translates into base_10 as: 32 + 64 + 128 = 224. */
  
IF (COLUMNS_UPDATED() & 224) > 0   
BEGIN
	UPDATE dbo.Zip
	SET dbo.Zip.Zip = NULL, dbo.Zip."Address" = @NewAddress, dbo.Zip.City_name = @NewCity_name, dbo.Zip.State_name = @NewState_name
	WHERE @OldAddress=Zip."Address" AND @OldCity_name=Zip.City_name AND @OldState_name=Zip.State_name
END;
