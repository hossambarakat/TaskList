IF NOT EXISTS (SELECT * FROM sysobjects WHERE NAME='Task' AND XTYPE='U')
BEGIN
	CREATE TABLE Task
	(
		[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
		[AddedOn] datetime DEFAULT GETDATE(),
		[IsComplete] bit DEFAULT (0),
		[Description] nvarchar(100)
	)
END