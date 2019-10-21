USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[SQLSOURCECONTROL_POPULATETABLE_B3SettingCategory]    Script Date: 10/21/2019 10:34:17 AM ******/
DROP PROCEDURE [dbo].[SQLSOURCECONTROL_POPULATETABLE_B3SettingCategory]
GO

/****** Object:  StoredProcedure [dbo].[SQLSOURCECONTROL_POPULATETABLE_B3SettingCategory]    Script Date: 10/21/2019 10:34:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Landerman, Lou
-- Create date: 10/17/2017
-- Description:	Populates Table B3SettingCategory
-- =============================================
CREATE PROCEDURE [dbo].[SQLSOURCECONTROL_POPULATETABLE_B3SettingCategory]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT 1 FROM [B3SettingCategory] WHERE [CategoryID] = 1)
	BEGIN
		INSERT INTO [B3SettingCategory] ([CategoryID],[CategoryName])VALUES(1,'Games')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingCategory] SET [CategoryName] = 'Games' WHERE [CategoryID] = 1;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingCategory] WHERE [CategoryID] = 2)
	BEGIN
		INSERT INTO [B3SettingCategory] ([CategoryID],[CategoryName])VALUES(2,'Operator')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingCategory] SET [CategoryName] = 'Operator' WHERE [CategoryID] = 2;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingCategory] WHERE [CategoryID] = 3)
	BEGIN
		INSERT INTO [B3SettingCategory] ([CategoryID],[CategoryName])VALUES(3,'Player')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingCategory] SET [CategoryName] = 'Player' WHERE [CategoryID] = 3;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingCategory] WHERE [CategoryID] = 4)
	BEGIN
		INSERT INTO [B3SettingCategory] ([CategoryID],[CategoryName])VALUES(4,'Sales')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingCategory] SET [CategoryName] = 'Sales' WHERE [CategoryID] = 4;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingCategory] WHERE [CategoryID] = 5)
	BEGIN
		INSERT INTO [B3SettingCategory] ([CategoryID],[CategoryName])VALUES(5,'Server Game')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingCategory] SET [CategoryName] = 'Server Game' WHERE [CategoryID] = 5;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingCategory] WHERE [CategoryID] = 6)
	BEGIN
		INSERT INTO [B3SettingCategory] ([CategoryID],[CategoryName])VALUES(6,'Session')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingCategory] SET [CategoryName] = 'Session' WHERE [CategoryID] = 6;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingCategory] WHERE [CategoryID] = 7)
	BEGIN
		INSERT INTO [B3SettingCategory] ([CategoryID],[CategoryName])VALUES(7,'System')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingCategory] SET [CategoryName] = 'System' WHERE [CategoryID] = 7;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingCategory] WHERE [CategoryID] = 8)
	BEGIN
		INSERT INTO [B3SettingCategory] ([CategoryID],[CategoryName])VALUES(8,'Geofencing')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingCategory] SET [CategoryName] = 'Geofencing' WHERE [CategoryID] = 8;
	END
END





GO


