USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[SQLSOURCECONTROL_POPULATETABLE_ModuleFeatures]    Script Date: 6/20/2019 10:40:56 AM ******/
DROP PROCEDURE [dbo].[SQLSOURCECONTROL_POPULATETABLE_ModuleFeatures]
GO

/****** Object:  StoredProcedure [dbo].[SQLSOURCECONTROL_POPULATETABLE_ModuleFeatures]    Script Date: 6/20/2019 10:40:56 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





-- ============================================================================
-- Author:		Landerman, Lou
-- Create date: 10/18/2017
-- Description:	Populates Table ModuleFeatures
--
-- 2018.03.08: jkim - added 'Editing daily menu buttons'
--
-- 2018.03.19: JAN - US5542 adding caller permissions
--
-- 2018.04.26: JAN - adding security center permissions
-- 2018.11.01: JKN - US5709 Adding Pre-Sales permissions
-- 2018.12.07: JBV = Added permission for Card Position Map management.
-- 2018.12.20: JKIM - updated Presale text to remove hyphen
-- 2019.02.13: JKN - US5775 Added permission to the Caller for the ability
--  to change the precall definition
-- 2019.02.25: RAK - Added authorized menu button.
-- 2019.06.19: KNC - Added authorized to removed players's comp
-- ============================================================================
CREATE PROCEDURE [dbo].[SQLSOURCECONTROL_POPULATETABLE_ModuleFeatures]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SET IDENTITY_INSERT [dbo].[ModuleFeatures] ON

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 1)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(1,1,'Open Discounts','Allows the user to add Open Discounts to a sale',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 1,[ModuleFeatureName] = 'Open Discounts',[ModuleFeatureDescription] = 'Allows the user to add Open Discounts to a sale',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 1;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 2)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(2,1,'Sale Lock Override','Allows the user to sell to a locked Game or locked Session',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 1,[ModuleFeatureName] = 'Sale Lock Override',[ModuleFeatureDescription] = 'Allows the user to sell to a locked Game or locked Session',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 2;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 3)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(3,1,'Credit Cash Out','Allows the user to cash out a player''s credit.',1,0,2)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 1,[ModuleFeatureName] = 'Credit Cash Out',[ModuleFeatureDescription] = 'Allows the user to cash out a player''s credit.',[IsCreditFeature] = 1,[IsGTIStaffFeature] = 0,[SequenceNo] = 2 WHERE [ModuleFeatureID] = 3;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 4)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(4,8,'Void Sale','Allows the user to void sales',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 8,[ModuleFeatureName] = 'Void Sale',[ModuleFeatureDescription] = 'Allows the user to void sales',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 4;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 5)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(5,43,'Allow Payouts','Allows the user to make payouts from the money center.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'Allow Payouts',[ModuleFeatureDescription] = 'Allows the user to make payouts from the money center.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 5;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 6)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(6,1,'Quantity Sale/Void','Allows the user to make a sale multiple times, automatically. Also allows the user to void any quantity sales.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 1,[ModuleFeatureName] = 'Quantity Sale/Void',[ModuleFeatureDescription] = 'Allows the user to make a sale multiple times, automatically. Also allows the user to void any quantity sales.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 6;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 7)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(7,2,'Unit Reset','Allows a unit to be Reset',0,1,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 2,[ModuleFeatureName] = 'Unit Reset',[ModuleFeatureDescription] = 'Allows a unit to be Reset',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 1,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 7;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 8)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(8,2,'Unit Unlock','Allows a unit to be unlocked',0,1,2)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 2,[ModuleFeatureName] = 'Unit Unlock',[ModuleFeatureDescription] = 'Allows a unit to be unlocked',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 1,[SequenceNo] = 2 WHERE [ModuleFeatureID] = 8;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 9)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(9,2,'Unit Find','Allows a unit to be searched',0,1,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 2,[ModuleFeatureName] = 'Unit Find',[ModuleFeatureDescription] = 'Allows a unit to be searched',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 1,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 9;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 10)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(10,2,'Unit Logout','Allows a unit to be unassigned',0,1,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 2,[ModuleFeatureName] = 'Unit Logout',[ModuleFeatureDescription] = 'Allows a unit to be unassigned',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 1,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 10;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 11)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(11,5,'Position Management','Allow or disallow a user access to creating, removing, or editing positions',0,1,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 5,[ModuleFeatureName] = 'Position Management',[ModuleFeatureDescription] = 'Allow or disallow a user access to creating, removing, or editing positions',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 1,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 11;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 12)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(12,43,'Purge Credit','Allows the user to purge all credit balances in the system.',1,0,4)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'Purge Credit',[ModuleFeatureDescription] = 'Allows the user to purge all credit balances in the system.',[IsCreditFeature] = 1,[IsGTIStaffFeature] = 0,[SequenceNo] = 4 WHERE [ModuleFeatureID] = 12;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 13)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(13,2,'Unit Remove Packs','Allows packs to be removed from a unit',0,1,2)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 2,[ModuleFeatureName] = 'Unit Remove Packs',[ModuleFeatureDescription] = 'Allows packs to be removed from a unit',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 1,[SequenceNo] = 2 WHERE [ModuleFeatureID] = 13;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 14)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(14,43,'View Progressives','Allows the user to view the progressive information only.',0,0,3)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'View Progressives',[ModuleFeatureDescription] = 'Allows the user to view the progressive information only.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 3 WHERE [ModuleFeatureID] = 14;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 15)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(15,43,'Issue Master Banks','Allows the user to issue, drop, close, and void both master and sub banks.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'Issue Master Banks',[ModuleFeatureDescription] = 'Allows the user to issue, drop, close, and void both master and sub banks.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 15;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 16)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(16,43,'Issue Banks','Allows the user to issue, drop, close, and void banks.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'Issue Banks',[ModuleFeatureDescription] = 'Allows the user to issue, drop, close, and void banks.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 16;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 17)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(17,43,'Modify Tax Forms','Allows the user to add and correct tax forms.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'Modify Tax Forms',[ModuleFeatureDescription] = 'Allows the user to add and correct tax forms.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 17;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 18)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(18,198,'Paper Inventory Modification','Allows the user to add and edit paper inventory items.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 198,[ModuleFeatureName] = 'Paper Inventory Modification',[ModuleFeatureDescription] = 'Allows the user to add and edit paper inventory items.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 18;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 19)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(19,198,'Paper Inventory Issue','Allows the user to issue paper inventory items to others.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 198,[ModuleFeatureName] = 'Paper Inventory Issue',[ModuleFeatureDescription] = 'Allows the user to issue paper inventory items to others.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 19;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 20)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(20,198,'Pull-tab Inventory Modification','Allows the user to add and edit pull-tab inventory items.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 198,[ModuleFeatureName] = 'Pull-tab Inventory Modification',[ModuleFeatureDescription] = 'Allows the user to add and edit pull-tab inventory items.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 20;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 21)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(21,198,'Pull-tab Inventory Issue','Allows the user to issue paper inventory items to others.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 198,[ModuleFeatureName] = 'Pull-tab Inventory Issue',[ModuleFeatureDescription] = 'Allows the user to issue paper inventory items to others.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 21;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 22)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(22,198,'Merchandise Inventory Modification','Allows the user to add and edit merchandise inventory items.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 198,[ModuleFeatureName] = 'Merchandise Inventory Modification',[ModuleFeatureDescription] = 'Allows the user to add and edit merchandise inventory items.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 22;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 23)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(23,198,'Merchandise Inventory Issue','Allows the user to issue merchandise inventory items to others.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 198,[ModuleFeatureName] = 'Merchandise Inventory Issue',[ModuleFeatureDescription] = 'Allows the user to issue merchandise inventory items to others.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 23;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 24)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(24,43,'Currency Management','Allows the user to manage currencies.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'Currency Management',[ModuleFeatureDescription] = 'Allows the user to manage currencies.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 24;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 25)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(25,198,'Modify Paper Layouts','Allows the user to add or edit Play with Paper Layouts.',0,0,2)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 198,[ModuleFeatureName] = 'Modify Paper Layouts',[ModuleFeatureDescription] = 'Allows the user to add or edit Play with Paper Layouts.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 2 WHERE [ModuleFeatureID] = 25;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 27)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(27,43,'View & Edit Progressives','Allows the user to add, edit, increase, and reseed progressives in the system.',0,0,3)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'View & Edit Progressives',[ModuleFeatureDescription] = 'Allows the user to add, edit, increase, and reseed progressives in the system.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 3 WHERE [ModuleFeatureID] = 27;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 28)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(28,43,'View, Edit, Reset, & Override Progressives','Allows the user to add, edit, increase, reseed, and override progressive balances in the system.',0,0,3)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'View, Edit, Reset, & Override Progressives',[ModuleFeatureDescription] = 'Allows the user to add, edit, increase, reseed, and override progressive balances in the system.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 3 WHERE [ModuleFeatureID] = 28;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 29)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(29,198,'Allow Issue Modifications','Allows the user to modify previously issued items',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 198,[ModuleFeatureName] = 'Allow Issue Modifications',[ModuleFeatureDescription] = 'Allows the user to modify previously issued items',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 29;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 30)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(30,43,'Allow TX Occasion Prize Payouts','Allows the user to set the TX occasion prize payouts.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'Allow TX Occasion Prize Payouts',[ModuleFeatureDescription] = 'Allows the user to set the TX occasion prize payouts.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 30;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 31)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(31,8,'Assign Receipt to Player','Allows the user to be able to assign a sales receipt to a player.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 8,[ModuleFeatureName] = 'Assign Receipt to Player',[ModuleFeatureDescription] = 'Allows the user to be able to assign a sales receipt to a player.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 31;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 32)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(32,8,'Move Receipt to Staff','Allows the user to move receipts to a staff member.',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 8,[ModuleFeatureName] = 'Move Receipt to Staff',[ModuleFeatureDescription] = 'Allows the user to move receipts to a staff member.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 32;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 33)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(33,43,'Edit Cash Transactions','Allows the user to make modifications to a previous days bank transactions',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'Edit Cash Transactions',[ModuleFeatureDescription] = 'Allows the user to make modifications to a previous days bank transactions',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 33;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 34)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(34,2,'Restart Crate Module','Allows the user to be able to restart the Crate Module through the UI',0,1,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 2,[ModuleFeatureName] = 'Restart Crate Module',[ModuleFeatureDescription] = 'Allows the user to be able to restart the Crate Module through the UI',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 1,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 34;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 35)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(35,248,'Allow Session Summary Modifications','When set the user will have permission to edit all values in the Session Summary',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 248,[ModuleFeatureName] = 'Allow Session Summary Modifications',[ModuleFeatureDescription] = 'When set the user will have permission to edit all values in the Session Summary',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 35;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 36)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(36,2,'Turn On Unit','Allows the unit to be powered on',0,1,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 2,[ModuleFeatureName] = 'Turn On Unit',[ModuleFeatureDescription] = 'Allows the unit to be powered on',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 1,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 36;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 37)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(37,2,'Turn Off Unit','Allows a unit to be powered off',0,1,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 2,[ModuleFeatureName] = 'Turn Off Unit',[ModuleFeatureDescription] = 'Allows a unit to be powered off',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 1,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 37;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 38)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(38,43,'Edit Payouts','Allows the user to make modifications to previous / current days payouts',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 43,[ModuleFeatureName] = 'Edit Payouts',[ModuleFeatureDescription] = 'Allows the user to make modifications to previous / current days payouts',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 38;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 39)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(39,6,'Coupon Management','Allows the user to manage coupons',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 6,[ModuleFeatureName] = 'Coupon Management',[ModuleFeatureDescription] = 'Allows the user to manage coupons',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 39;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 40)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(40,247,'Start Session','Allows the user to start B3 Session',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 247,[ModuleFeatureName] = 'Start Session',[ModuleFeatureDescription] = 'Allows the user to start B3 Session',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 40;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 41)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(41,247,'End Session','Allows the user to end B3 Session',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 247,[ModuleFeatureName] = 'End Session',[ModuleFeatureDescription] = 'Allows the user to end B3 Session',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 41;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 42)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(42,247,'Set Balls','Allows the user to set balls in B3',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 247,[ModuleFeatureName] = 'Set Balls',[ModuleFeatureDescription] = 'Allows the user to set balls in B3',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 42;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 43)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(43,247,'Reports','Allows the user to view B3 report',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 247,[ModuleFeatureName] = 'Reports',[ModuleFeatureDescription] = 'Allows the user to view B3 report',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 43;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 44)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(44,247,'Settings','Allows the user to modify B3 settings',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 247,[ModuleFeatureName] = 'Settings',[ModuleFeatureDescription] = 'Allows the user to modify B3 settings',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 44;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 45)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(45,247,'Sales','Allows the user to make B3 Sales',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 247,[ModuleFeatureName] = 'Sales',[ModuleFeatureDescription] = 'Allows the user to make B3 Sales',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 45;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 46)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(46,247,'Redeem','Allows the user to redeem price from B3 game',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 247,[ModuleFeatureName] = 'Redeem',[ModuleFeatureDescription] = 'Allows the user to redeem price from B3 game',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 46;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 48)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(48,3,'Manual Point Adjustment','Award Points to Player',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 3,[ModuleFeatureName] = 'Manual Point Adjustment',[ModuleFeatureDescription] = 'Award Points to Player',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 48;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 49)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(49,6,'Editing daily menu buttons','Ability to change prices of packages without having to send override',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 6,[ModuleFeatureName] = 'Editing daily menu buttons',[ModuleFeatureDescription] = 'Ability to change prices of packages without having to send override',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 49;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 50)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(50,11,'Cancel Calls','Ability to cancel calls on the caller',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 11,[ModuleFeatureName] = 'Cancel Calls',[ModuleFeatureDescription] = 'Ability to cancel calls on the caller',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 50;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 51)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(51,11,'Change Cooldown Timer','Ability to change the amount of time between ball calls',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 11,[ModuleFeatureName] = 'Change Cooldown Timer',[ModuleFeatureDescription] = 'Ability to change the amount of time between ball calls',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 51;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 52)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(52,11,'Manage extra balls','Ability to change which extra balls are enabled for each game',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 11,[ModuleFeatureName] = 'Manage extra balls',[ModuleFeatureDescription] = 'Ability to change which extra balls are enabled for each game',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 52;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 53)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(53,11,'Rack Balls','Ability to perform the rack all',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 11,[ModuleFeatureName] = 'Rack Balls',[ModuleFeatureDescription] = 'Ability to perform the rack all',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 53;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 54)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(54,11,'Drop Balls (tech screen)','Ability to perform the drop balls from the blower tech screen',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 11,[ModuleFeatureName] = 'Drop Balls (tech screen)',[ModuleFeatureDescription] = 'Ability to perform the drop balls from the blower tech screen',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 54;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 55)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(55,11,'Pick Pattern','Ability to pick a different pattern from the callers choice',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 11,[ModuleFeatureName] = 'Pick Pattern',[ModuleFeatureDescription] = 'Ability to pick a different pattern from the callers choice',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 55;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 56)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(56,11,'Set Bonus Balls','Ability to set a ball as a bonus',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 11,[ModuleFeatureName] = 'Set Bonus Balls',[ModuleFeatureDescription] = 'Ability to set a ball as a bonus',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 56;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 57)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(57,5,'View Staff Information','Allows the user to view staff information',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 5,[ModuleFeatureName] = 'View Staff Information',[ModuleFeatureDescription] = 'Allows the user to view staff information',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 57;
	END
    
	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 58)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(58,5,'Edit Staff Information','Allows the user to edit staff information',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 5,[ModuleFeatureName] = 'Edit Staff Information',[ModuleFeatureDescription] = 'Allows the user to edit staff information',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 58;
	END
    
	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 59)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(59,5,'Activate Staff','Allows the user to activate and deactivate staff',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 5,[ModuleFeatureName] = 'Activate Staff',[ModuleFeatureDescription] = 'Allows the user to activate and deactivate staff',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 59;
	END
    
	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 60)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(60,5,'Lock Staff','Allows the user to lock and unlock staff',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 5,[ModuleFeatureName] = 'Lock Staff',[ModuleFeatureDescription] = 'Allows the user to lock and unlock staff',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 60;
	END
    
	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 61)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(61,5,'Change Staff Password','Allows the user to change another staff''s password',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 5,[ModuleFeatureName] = 'Change Staff Password',[ModuleFeatureDescription] = 'Allows the user to change another staff''s password',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 61;
	END
    
	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 62)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(62,5,'Manage Staff Member''s Positions','Allows the user to manage the positions that a staff has assigned to them',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 5,[ModuleFeatureName] = 'Manage Staff Member''s Positions',[ModuleFeatureDescription] = 'Allows the user to manage the positions that a staff has assigned to them',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 62;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 63)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(63,1,'Refund Presale Transactions','Allows the user to be able to refund a transaction that was presold for an event',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 1,[ModuleFeatureName] = 'Refund Presale Transactions',[ModuleFeatureDescription] = 'Allows the user to be able to refund a transaction that was presold for an event',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 63;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 64)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(64,22,'Create Presales Events','Allows the user the ability to enable and disable the presales flag on events',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 22,[ModuleFeatureName] = 'Create Presales Events',[ModuleFeatureDescription] = 'Allows the user the ability to enable and disable the presales flag on events',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 64;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 65)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(65,22,'Cancel Presale Events','Allows the user the ability to cancel an event that can be presold',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 22,[ModuleFeatureName] = 'Cancel Presale Events',[ModuleFeatureDescription] = 'Allows the user the ability to cancel an event that can be presold',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 65;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 66)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(66,3,'Expire Player Points','Allows the user to zero-out player point balances',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 3,[ModuleFeatureName] = 'Expire Player Points', [ModuleFeatureDescription] = 'Allows the user to zero-out player point balances',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 66;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 67)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])
		VALUES(67, 6, 'Card Position Map Management', 'Allows the user to manage card position maps', 0, 0, 1)
		;
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] 
		SET [ModuleID] = 6, [ModuleFeatureName] = 'Card Position Map Management', [ModuleFeatureDescription] = 'Allows the user to manage card position maps', [IsCreditFeature] = 0, [IsGTIStaffFeature] = 0, [SequenceNo] = 1 
		WHERE [ModuleFeatureID] = 67;
	END

    IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureId] = 68)
    BEGIN
        INSERT INTO [ModuleFeatures] ([ModuleFeatureId],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(68,11,'Change precall definition','Ability to change the precall definition from what was defined in the game.',0,0,1)
    END
    ELSE
    BEGIN
        UPDATE [ModuleFeatures] SET [ModuleID] = 11,[ModuleFeatureName] = 'Change precall definition', [ModuleFeatureDescription] = 'Ability to change the precall definition from what was defined in the game.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 68;
    END

    IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureId] = 69)
    BEGIN
        INSERT INTO [ModuleFeatures] ([ModuleFeatureId],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(69,1,'Authorized menu button access','User may authorize the use of an authorization required menu button.',0,0,1)
    END
    ELSE
    BEGIN
        UPDATE [ModuleFeatures] SET [ModuleID] = 1, [ModuleFeatureName] = 'Authorized menu button access', [ModuleFeatureDescription] = 'User may authorize the use of an authorization required menu button.',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 69;
    END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 70)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(70,198,'Allow Edit Menu','Allows the user to use the edit menu in Inventory Center',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 198,[ModuleFeatureName] = 'Allow Edit Menu',[ModuleFeatureDescription] = 'Allows the user to use the edit menu in Inventory Center',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 70;
	END
	
	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 71)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(71,198,'Allow Issue Price Changes','Allows the user to change prices when issuing in Inventory Center',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 198,[ModuleFeatureName] = 'Allow Issue Price Changes',[ModuleFeatureDescription] = 'Allows the user to change prices when issuing in Inventory Center',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 71;
	END

	IF NOT EXISTS (SELECT 1 FROM [ModuleFeatures] WHERE [ModuleFeatureID] = 72)
	BEGIN
		INSERT INTO [ModuleFeatures] ([ModuleFeatureID],[ModuleID],[ModuleFeatureName],[ModuleFeatureDescription],[IsCreditFeature],[IsGTIStaffFeature],[SequenceNo])VALUES(72,3,'Removed Coupon from Player','Allows the user to removed coupon of a existing player',0,0,1)
	END
	ELSE
	BEGIN
		UPDATE [ModuleFeatures] SET [ModuleID] = 3,[ModuleFeatureName] = 'Removed Coupon from Player',[ModuleFeatureDescription] = 'Allows the user to removed coupon of a existing player',[IsCreditFeature] = 0,[IsGTIStaffFeature] = 0,[SequenceNo] = 1 WHERE [ModuleFeatureID] = 72;
	END

	SET IDENTITY_INSERT [dbo].[ModuleFeatures] OFF
END



GO


