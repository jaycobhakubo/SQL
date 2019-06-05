USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spLoadPlayerListDetails]    Script Date: 06/05/2019 15:06:46 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spLoadPlayerListDetails]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spLoadPlayerListDetails]
GO

USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spLoadPlayerListDetails]    Script Date: 06/05/2019 15:06:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spLoadPlayerListDetails]
--====================================================================================
-- 2019.01.21 jbv : created common procedure for loading/interpreting player list details.
--====================================================================================
	@definitionId int
	, @BDFrom DATETIME OUTPUT
	, @BDEnd DATETIME OUTPUT
	, @GenderType NVARCHAR(4) OUTPUT
	, @Min MONEY OUTPUT
	, @Max MONEY OUTPUT
	, @PBOptionSelected NVARCHAR(50) OUTPUT
	, @PBOptionValue MONEY OUTPUT
	, @LVStart DATETIME OUTPUT
	, @LVEnd DATETIME OUTPUT
	, @Spend BIT OUTPUT
	, @Average BIT OUTPUT
	, @AmountFrom MONEY OUTPUT
	, @AmountTo MONEY OUTPUT
	, @StartDate DATETIME OUTPUT
	, @EndDate DATETIME OUTPUT
	, @SAOption BIT OUTPUT
	, @SAOptionSelected NVARCHAR(50) OUTPUT
	, @SAOptionValue MONEY OUTPUT
	, @StatusID NVARCHAR(MAX) OUTPUT
	, @LocationType INT OUTPUT
	, @LocationDefinition NVARCHAR(MAX) OUTPUT
	, @IsNOfDaysPlayed BIT OUTPUT
	, @IsNOfSessioPlayed BIT OUTPUT
	, @DPDateRangeFrom DATETIME OUTPUT
	, @DPDateRangeTo DATETIME OUTPUT
	, @IsDPRange BIT OUTPUT
	, @DPRangeFrom INT OUTPUT
	, @DPRangeTo INT OUTPUT
	, @IsDPOption BIT OUTPUT
	, @DPOprtionSelected NVARCHAR(50) OUTPUT
	, @DPOptionValue INT OUTPUT
	, @IsSPRange BIT OUTPUT
	, @SPRangeFrom INT OUTPUT
	, @SPRangeTo INT OUTPUT
	, @IsSPOption BIT OUTPUT
	, @SPOprtionSelected NVARCHAR(50) OUTPUT
	, @SPOptionValue INT OUTPUT
	, @DaysOfWeekNSessionNbr VARCHAR(MAX) OUTPUT
	, @IsPackageName BIT OUTPUT
	, @PackageName VARCHAR(500) OUTPUT
AS
BEGIN

	SET NOCOUNT ON;

	SET @BDFrom = '1900-01-01 00:00:00';
	SET @BDEnd = '1900-01-01 00:00:00';
	SET @GenderType = '';
	SET @Min = -1;
	SET @Max = 0;
	SET @PBOptionSelected = '';
	SET @PBOptionValue = 0;
	SET @LVStart = '1900-01-01 00:00:00';
	SET @LVEnd = '1900-01-01 00:00:00';
	SET @Spend = 0;
	SET @Average = 0;
	SET @AmountFrom = 0;
	SET @AmountTo = 0;
	SET @StartDate = '1900-01-01 00:00:00';
	SET @EndDate = '1900-01-01 00:00:00';
	SET @SAOption = 0;
	SET @SAOptionSelected = '';
	SET @SAOptionValue = 0;
	SET @StatusID = N'';
	SET @LocationType = 0;
	SET @LocationDefinition = N'';
	SET @IsNOfDaysPlayed = 0;
	SET @IsNOfSessioPlayed = 0;
	SET @DPDateRangeFrom = '1900-01-01 00:00:00';
	SET @DPDateRangeTo = '1900-01-01 00:00:00';
	SET @IsDPRange = 0;
	SET @DPRangeFrom = 0;
	SET @DPRangeTo = 0;
	SET @IsDPOption = 0;
	SET @DPOprtionSelected = N'';
	SET @DPOptionValue = 0;
	SET @IsSPRange = 0;
	SET @SPRangeFrom = 0;
	SET @SPRangeTo = 0;
	SET @IsSPOption = 0;
	SET @SPOprtionSelected = N'';
	SET @SPOptionValue = 0;
	SET @DaysOfWeekNSessionNbr = '';
	SET @IsPackageName = 0;
	SET @PackageName = '';

	DECLARE @SettingID int
		, @SettingValue varchar(500)
		;

	DECLARE PlayerListDetailCursor CURSOR FAST_FORWARD
		FOR
		SELECT SettingID, SettingValue
		FROM PlayerListDetail
		WHERE ListDefinitionId = @definitionId
		;

	OPEN PlayerListDetailCursor;
	FETCH NEXT FROM PlayerListDetailCursor INTO @SettingID, @SettingValue;

	WHILE @@FETCH_STATUS = 0
	BEGIN

		IF (@SettingID = 1 /* Gender */)
			SET @GenderType = @SettingValue;
		ELSE IF (@SettingID = 2 /* Status */)
			SET @StatusID = @SettingValue;
		ELSE IF (@SettingID = 3 /* Birthday Between (from) */)
			SET @BDFrom = @SettingValue;
		ELSE IF (@SettingID = 4 /* Birthday To */)
			SET @BDEnd = @SettingValue;
		ELSE IF (@SettingID = 5 /* City */)
		BEGIN
			SET @LocationDefinition = @SettingValue;
			SET @LocationType = 1 /* City */;
		END
		ELSE IF (@SettingID = 6 /* State */)
		BEGIN
			SET @LocationDefinition = @SettingValue;;
			SET @LocationType = 2 /* State */;
		END
		ELSE IF (@SettingID = 7 /* Postal */)
		BEGIN
			SET @LocationDefinition = @SettingValue;
			SET @LocationType = 3 /* Postal */;
		END
		ELSE IF (@SettingID = 8 /* Country */)
		BEGIN
			SET @LocationDefinition = @SettingValue;
			SET @LocationType = 4 /* Country */;
		END
		ELSE IF (@SettingID = 9 /* Visited from */)
			SET @DPDateRangeFrom = @SettingValue;
		ELSE IF (@SettingID = 10 /* Visited to */)
			SET @DPDateRangeTo = @SettingValue;
		ELSE IF (@SettingID = 11 /* Last Visit Between (from) */)
			SET @LVStart = @SettingValue;
		ELSE IF (@SettingID = 12 /* Last Visit to */)
			SET @LVEnd = @SettingValue;
		ELSE IF (@SettingID = 13 /* Number of days visited from */)
			SET @DPRangeFrom = @SettingValue;
		ELSE IF (@SettingID = 14 /* Number of days visited to */)
			SET @DPRangeTo = @SettingValue;
		ELSE IF (@SettingID = 15 /* Number of Days Visited Greater Than */)
		BEGIN
			SET @DPOprtionSelected = '>';
			SET @DPOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 16 /* Number of Days Visited Greater Than Or Equal To */)
		BEGIN
			SET @DPOprtionSelected = '>=';
			SET @DPOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 17 /* Number of Days Visited Equal To */)
		BEGIN
			SET @DPOprtionSelected = '=';
			SET @DPOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 18 /* Number of Days Visited Less Than Or Equal To */)
		BEGIN
			SET @DPOprtionSelected = '<=';
			SET @DPOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 19 /* Number of Days Visited Less Than */)
		BEGIN
			SET @DPOprtionSelected = '<';
			SET @DPOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 20 /* Number of Sessions Visited From */)
			SET @SPRangeFrom = @SettingValue;
		ELSE IF (@SettingID = 21 /* Number of Sessions Vistsed To */)
			SET @SPRangeTo = @SettingValue;
		ELSE IF (@SettingID = 22 /* Number of Sessions Visited Greater Than */)
		BEGIN
			SET @SPOprtionSelected = '>';
			SET @SPOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 23 /* Number of Sessions Visited Greater Than Or Equal To */)
		BEGIN
			SET @SPOprtionSelected = '>=';
			SET @SpOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 24 /* Number of Sessions Visited Equal To */)
		BEGIN
			SET @SPOprtionSelected = '=';
			SET @SPOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 25 /* Number of Sessions Visited Less Than Or Equal To */)
		BEGIN
			SET @SPOprtionSelected = '<=';
			SET @SPOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 26 /* Number of Sessions Visited Less Than */)
		BEGIN
			SET @SPOprtionSelected = '<';
			SET @SPOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 27 /* Days of Week Session */)
		BEGIN
			SET @DaysOfWeekNSessionNbr = @SettingValue;
			SET @IsNOfSessioPlayed = 1;
		END
		ELSE IF (@SettingID = 28 /* Spend From */)
			SET @StartDate = @SettingValue;
		ELSE IF (@SettingID = 29 /* Spend To */)
			SET @EndDate = @SettingValue;
		ELSE IF (@SettingID = 30 /* Product Purchased */)
		BEGIN
			SET @IsPackageName = 1;
			SET @PackageName = @SettingValue;
		END
		ELSE IF (@SettingID = 31 /* Point Balance From */)
			SET @Min = @SettingValue;
 		ELSE IF (@SettingID = 32 /* Point Balance To */)
			SET @Max = @SettingValue;
		ELSE IF (@SettingID = 33 /* Point Balance Greater Than */)
		BEGIN
			SET @PBOptionSelected = '>';
			SET @PBOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 34 /* Point Balance Greater Than Or Equal To */)
		BEGIN
			SET @PBOptionSelected = '>=';
			SET @PBOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 35 /* Point Balance Equal To */)
		BEGIN
			SET @PBOptionSelected = '=';
			SET @PBOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 36 /* Point Balance Less Than Or Equal To */)
		BEGIN
			SET @PBOptionSelected = '<=';
			SET @PBOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 37 /* Point Balance Less Than */)
		BEGIN
			SET @PBOptionSelected = '<';
			SET @PBOptionValue = @SettingValue;
		END
		ELSE IF (@SettingID = 38 /* Spend From value */)
		BEGIN
			SET @IsSPRange = 1;
			SET @AmountFrom = @SettingValue;
			SET @Spend = 1;
		END
		ELSE IF (@SettingID = 39 /* Spend To value */)
			SET @AmountTo = @SettingValue;
		ELSE IF (@SettingID = 40 /* Spend Greater Than */)
		BEGIN
			SET @SAOption = 1;
			SET @SAOptionSelected = '>';
			SET @SAOptionValue = @SettingValue;
			SET @Spend = 1;
		END
		ELSE IF (@SettingID = 41 /* Spend Greater Than Or Equal To */)
		BEGIN
			SET @SAOption = 1;
			SET @SAOptionSelected = '>=';
			SET @SAOptionValue = @SettingValue;
			SET @Spend = 1;
		END
		ELSE IF (@SettingID = 42 /* Spend Equal To */)
		BEGIN
			SET @SAOption = 1;
			SET @SAOptionSelected = '=';
			SET @SAOptionValue = @SettingValue;
			SET @Spend = 1;
		END
		ELSE IF (@SettingID = 43 /* Spend Less Than Or Equal To */)
		BEGIN
			SET @SAOption = 1;
			SET @SAOptionSelected = '<=';
			SET @SAOptionValue = @SettingValue;
			SET @Spend = 1;
		END
		ELSE IF (@SettingID = 44 /* Spend Less Than */)
		BEGIN
			SET @SAOption = 1;
			SET @SAOptionSelected = '<';
			SET @SAOptionValue = @SettingValue;
			SET @Spend = 1;
		END
		ELSE IF (@SettingID = 45 /* Average Spend From */)
		BEGIN
			SET @IsSPRange = 1;
			SET @AmountFrom = @SettingValue;
			SET @Average = 1;
		END
		ELSE IF (@SettingID = 46 /* Average Spend To */)
			SET @AmountTo = @SettingValue;
		ELSE IF (@SettingID = 47 /* Average Spend Greater Than */)
		BEGIN
			SET @SAOption = 1;
			SET @SAOptionSelected = '>';
			SET @SAOptionValue = @SettingValue;
			SET @Average = 1;
		END
		ELSE IF (@SettingID = 48 /* Average Greater Than Or Equal To */)
		BEGIN
			SET @SAOption = 1;
			SET @SAOptionSelected = '>=';
			SET @SAOptionValue = @SettingValue;
			SET @Average = 1;
		END
		ELSE IF (@SettingID = 49 /* Average Equal To */)
		BEGIN
			SET @SAOption = 1;
			SET @SAOptionSelected = '=';
			SET @SAOptionValue = @SettingValue;
			SET @Average = 1;
		END
		ELSE IF (@SettingID = 50 /* Average Less Than Or Equal To */)
		BEGIN
			SET @SAOption = 1;
			SET @SAOptionSelected = '<=';
			SET @SAOptionValue = @SettingValue;
			SET @Average = 1;
		END
		ELSE IF (@SettingID = 51 /* Average Less Than */)
		BEGIN
			SET @SAOption = 1;
			SET @SAOptionSelected = '<';
			SET @SAOptionValue = @SettingValue;
			SET @Average = 1;
		END

		FETCH NEXT FROM PlayerListDetailCursor INTO @SettingID, @SettingValue;

	END

	CLOSE PlayerListDetailCursor
	DEALLOCATE PlayerListDetailCursor

	IF @SPRangeFrom = 0 AND @SPRangeTo = 0 AND @SPOptionValue = 0
		SET @IsNOfSessioPlayed = 0;

END

GO


