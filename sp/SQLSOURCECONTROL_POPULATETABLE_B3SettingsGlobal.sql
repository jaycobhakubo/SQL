USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[SQLSOURCECONTROL_POPULATETABLE_B3SettingsGlobal]    Script Date: 10/21/2019 10:22:27 AM ******/
DROP PROCEDURE [dbo].[SQLSOURCECONTROL_POPULATETABLE_B3SettingsGlobal]
GO

/****** Object:  StoredProcedure [dbo].[SQLSOURCECONTROL_POPULATETABLE_B3SettingsGlobal]    Script Date: 10/21/2019 10:22:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Landerman, Lou
-- Create date: 10/18/2017
-- Description:	Populates Table B3SettingsGlobal
-- =============================================
CREATE PROCEDURE [dbo].[SQLSOURCECONTROL_POPULATETABLE_B3SettingsGlobal]
AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 1)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(1,1,NULL, 'Denom 1')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Denom 1' WHERE [SettingID] = 1;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 2)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(2,1,NULL, 'Denom 5')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Denom 5' WHERE [SettingID] = 2;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 3)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(3,1,NULL, 'Denom 10')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Denom 10' WHERE [SettingID] = 3;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 4)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(4,1,NULL, 'Denom 25')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Denom 25' WHERE [SettingID] = 4;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 5)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(5,1,NULL, 'Denom 50')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Denom 50' WHERE [SettingID] = 5;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 6)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(6,1,NULL, 'Denom 100')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Denom 100' WHERE [SettingID] = 6;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 7)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(7,1,NULL, 'Denom 200')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Denom 200' WHERE [SettingID] = 7;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 8)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(8,1,NULL, 'Denom 500')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Denom 500' WHERE [SettingID] = 8;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 9)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(9,1,NULL, 'Max Bet Level')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Max Bet Level' WHERE [SettingID] = 9;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 10)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(10,1,NULL, 'Max Cards')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Max Cards' WHERE [SettingID] = 10;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 11)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(11,1,NULL, 'Call Speed')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Call Speed' WHERE [SettingID] = 11;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 12)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(12,1,NULL, 'Auto Call')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Auto Call' WHERE [SettingID] = 12;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 13)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(13,1,NULL, 'Auto Play')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Auto Play' WHERE [SettingID] = 13;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 14)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(14,1,NULL, 'Hide Serial Number')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Hide Serial Number' WHERE [SettingID] = 14;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 15)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(15,1,NULL, 'Single Offer Bonus')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Single Offer Bonus' WHERE [SettingID] = 15;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 16)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(16,3,'F', 'Calibrate Touch')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 3, [SettingDesc] = 'Calibrate Touch' WHERE [SettingID] = 16;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 17)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(17,3,'F', 'Press to Collect')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 3, [SettingDesc] = 'Press to Collect' WHERE [SettingID] = 17;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 18)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(18,3,'F', 'Announce Call')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 3, [SettingDesc] = 'Announce Call' WHERE [SettingID] = 18;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 19)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(19,3,'F', 'Screen Cursor')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 3, [SettingDesc] = 'Screen Cursor' WHERE [SettingID] = 19;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 20)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(20,3,'30', 'Time To Collect')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 3, [SettingDesc] = 'Time To Collect' WHERE [SettingID] = 20;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 21)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(21,3,'F', 'Disclaimer')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 3, [SettingDesc] = 'Disclaimer' WHERE [SettingID] = 21;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 22)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(22,3,'1', 'Disclaimer Text ID')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 3, [SettingDesc] = 'Disclaimer Text ID' WHERE [SettingID] = 22;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 23)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(23,3,'85', 'Main Volume')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 3, [SettingDesc] = 'Main Volume' WHERE [SettingID] = 23;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 24)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(24,4,'F', 'Screen Cursor')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 4, [SettingDesc] = 'Screen Cursor' WHERE [SettingID] = 24;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 25)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(25,4,'F', 'Calibrate Touch')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 4, [SettingDesc] = 'Calibrate Touch' WHERE [SettingID] = 25;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 26)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(26,4,'F', 'Auto Print Session Report')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 4, [SettingDesc] = 'Auto Print Session Report' WHERE [SettingID] = 26;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 27)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(27,4,'T', 'Page Printer')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 4, [SettingDesc] = 'Page Printer' WHERE [SettingID] = 27;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 28)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(28,4,'T', 'Quick Sales')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 4, [SettingDesc] = 'Quick Sales' WHERE [SettingID] = 28;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 29)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(29,4,'T', 'Print Logo')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 4, [SettingDesc] = 'Print Logo' WHERE [SettingID] = 29;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 30)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(30,4,'F', 'Allow in Session Ball Change')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 4, [SettingDesc] = 'Allow in Session Ball Change' WHERE [SettingID] = 30;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 31)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(31,4,'F', 'Logging Enable')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 4, [SettingDesc] = 'Logging Enable' WHERE [SettingID] = 31;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 32)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(32,4,'7', 'Log Recycle Days')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 4, [SettingDesc] = 'Log Recycle Days' WHERE [SettingID] = 32;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 33)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(33,4,'75', 'Main Volume')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 4, [SettingDesc] = 'Main Volume' WHERE [SettingID] = 33;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 34)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(34,5,'2', 'Min Player')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 5, [SettingDesc] = 'Min Player' WHERE [SettingID] = 34;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 35)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(35,5,'10', 'Game Start Delay')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 5, [SettingDesc] = 'Game Start Delay' WHERE [SettingID] = 35;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 36)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(36,5,'1', 'Consolotion Prize')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 5, [SettingDesc] = 'Consolotion Prize' WHERE [SettingID] = 36;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 37)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(37,5,'recall', 'Game Recall Password')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 5, [SettingDesc] = 'Game Recall Password' WHERE [SettingID] = 37;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 38)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(38,5,'10', 'Wait Count Down')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 5, [SettingDesc] = 'Wait Count Down' WHERE [SettingID] = 38;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 39)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(39,6,'300000', 'Payout Limit')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 6, [SettingDesc] = 'Payout Limit' WHERE [SettingID] = 39;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 40)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(40,6,'5000', 'Jackpot Limit')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 6, [SettingDesc] = 'Jackpot Limit' WHERE [SettingID] = 40;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 41)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(41,6,'T', 'Enforce Mix')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 6, [SettingDesc] = 'Enforce Mix' WHERE [SettingID] = 41;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 42)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(42,7,'0', 'Hand Pay Trigger')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Hand Pay Trigger' WHERE [SettingID] = 42;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 43)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(43,7,'0', 'Minimum Players')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Minimum Players' WHERE [SettingID] = 43;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 44)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(44,7,'1', 'VIP Point Multiplier')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'VIP Point Multiplier' WHERE [SettingID] = 44;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 45)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(45,7,':', 'Mag Card Sentinel Start')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Mag Card Sentinel Start' WHERE [SettingID] = 45;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 46)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(46,7,'?', 'Mag Card Sentinel End')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Mag Card Sentinel End' WHERE [SettingID] = 46;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 47)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(47,7,'DOLLAR', 'Currency')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Currency' WHERE [SettingID] = 47;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 48)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(48,7,'5000', 'RNG Ball Call Time')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'RNG Ball Call Time' WHERE [SettingID] = 48;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 49)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(49,7,'4', 'Player PIN Length')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Player PIN Length' WHERE [SettingID] = 49;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 50)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(50,7,'F', 'Enable UK')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Enable UK' WHERE [SettingID] = 50;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 51)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(51,7,'F', 'Dual Account')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Dual Account' WHERE [SettingID] = 51;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 52)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(52,7,'T', 'Multi Operator')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Multi Operator' WHERE [SettingID] = 52;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 53)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(53,7,'F', 'Common RNG Ball Call')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Common RNG Ball Call' WHERE [SettingID] = 53;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 54)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(54,7,'F', 'North Dakota Mode')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'North Dakota Mode' WHERE [SettingID] = 54;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 55)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(55,7,'OFF', 'Auto Session End')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Auto Session End' WHERE [SettingID] = 55;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 56)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(56,7,'GameTech', 'Site Name')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Site Name' WHERE [SettingID] = 56;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 57)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(57,7,'85', 'Main Volume')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 7, [SettingDesc] = 'Main Volume' WHERE [SettingID] = 57;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 58)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(58,1,'0', 'MathPayTable Setting')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'MathPayTable Setting' WHERE [SettingID] = 58;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 59)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(59,1,NULL, 'Call Speed Min')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Call Speed Min' WHERE [SettingID] = 59;
	END

	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 60)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(60,1,NULL, 'Call Speed Bonus')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Call Speed Bonus' WHERE [SettingID] = 60;
	END
		
	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 62)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(62,1,NULL, 'Hand Pay By Pattern')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'Hand Pay By Pattern' WHERE [SettingID] = 62;
	END
		
	IF NOT EXISTS (SELECT 1 FROM [B3SettingsGlobal] WHERE [SettingID] = 63)
	BEGIN
		INSERT INTO [B3SettingsGlobal] ([SettingID],[SettingCategoryID],[SettingValue],[SettingDesc])VALUES(63,1,NULL, 'RF Required For Play')
	END
	ELSE
	BEGIN
		UPDATE [B3SettingsGlobal] SET [SettingCategoryID] = 1, [SettingDesc] = 'RF Required For Play' WHERE [SettingID] = 63;
	END
END






GO


