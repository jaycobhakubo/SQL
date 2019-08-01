USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spRaffle_GetNumberOfPlayerPerList]    Script Date: 8/1/2019 1:18:52 PM ******/
DROP PROCEDURE [dbo].[spRaffle_GetNumberOfPlayerPerList]
GO

/****** Object:  StoredProcedure [dbo].[spRaffle_GetNumberOfPlayerPerList]    Script Date: 8/1/2019 1:18:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE procedure [dbo].[spRaffle_GetNumberOfPlayerPerList]
--=============================================================================
-- 2016.01.06 US4438 Adding support for calculating the number of entries
-- when using a player list to run the raffle
-- 2017.08.04 tmp: DE13691 Does not return players when the player list is set to use spend and day of week and session.
-- @IsNOOfSessionsPlayed was set to 1 when Day of Week and session was set and spend range was set.
-- 2019.01.21 jbv: Replaced player list detail processing code (duplicated across many procs) 
--                 with call to new LoadPlayerListDetails proc
--=============================================================================
 @operatorId int
 ,@definitionId int
 ,@playerCount int output
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @BDFrom Datetime, @BDEnd Datetime
		, @GenderType nvarchar(4)
		, @Min Money, @Max Money
		, @PBOptionSelected nvarchar(50), @PBOptionValue money
		, @LVStart Datetime, @LVEnd Datetime
		, @Spend bit
		, @Average Bit
		, @AmountFrom money, @AmountTo money
		, @StartDate Datetime, @EndDate Datetime
		, @SAOption bit, @SAOptionSelected nvarchar(50), @SAOptionValue money
		, @StatusID nvarchar(max)
		, @LocationType int, @LocationDefinition nvarchar(max)
		, @IsNOfDaysPlayed bit, @IsNOfSessioPlayed bit
		, @DPDateRangeFrom datetime, @DPDateRangeTo datetime
		, @IsDPRange bit, @DPRangeFrom int, @DPRangeTo int
		, @IsDPOption bit, @DPOprtionSelected nvarchar(50), @DPOptionValue int
		, @IsSPRange bit, @SPRangeFrom int, @SPRangeTo int
		, @IsSPOption bit, @SPOprtionSelected nvarchar(50), @SPOptionValue int
		, @DaysOfWeekNSessionNbr varchar(max)
		, @IsPackageName bit, @PackageName varchar(500)
		, @AgeOptionSelected NVARCHAR(50)
		, @AgeValue INT
		;

	EXEC spLoadPlayerListDetails @definitionId
		, @BDFrom OUTPUT, @BDEnd OUTPUT
		, @GenderType OUTPUT
		, @Min OUTPUT, @Max OUTPUT
		, @PBOptionSelected OUTPUT, @PBOptionValue OUTPUT
		, @LVStart OUTPUT, @LVEnd OUTPUT
		, @Spend OUTPUT
		, @Average OUTPUT
		, @AmountFrom OUTPUT, @AmountTo OUTPUT
		, @StartDate OUTPUT, @EndDate OUTPUT
		, @SAOption OUTPUT, @SAOptionSelected OUTPUT, @SAOptionValue OUTPUT
		, @StatusID OUTPUT
		, @LocationType OUTPUT, @LocationDefinition OUTPUT
		, @IsNOfDaysPlayed OUTPUT, @IsNOfSessioPlayed OUTPUT
		, @DPDateRangeFrom OUTPUT, @DPDateRangeTo OUTPUT
		, @IsDPRange OUTPUT, @DPRangeFrom OUTPUT, @DPRangeTo OUTPUT
		, @IsDPOption OUTPUT, @DPOprtionSelected OUTPUT, @DPOptionValue OUTPUT
		, @IsSPRange OUTPUT, @SPRangeFrom OUTPUT, @SPRangeTo OUTPUT
		, @IsSPOption OUTPUT, @SPOprtionSelected OUTPUT, @SPOptionValue OUTPUT
		, @DaysOfWeekNSessionNbr OUTPUT
		, @IsPackageName OUTPUT, @PackageName OUTPUT
		, @AgeOptionSelected OUTPUT , @AgeValue OUTPUT
		;	

	EXEC spRptPlayerList2 @operatorId
		, @BDFrom, @BDEnd
		, @GenderType
		, @Min, @Max
		, @PBOptionSelected, @PBOptionValue
		, @LVStart, @LVEnd
		, @Spend
		, @Average
		, @AmountFrom, @AmountTo
		, @StartDate, @EndDate
		, @SAOption, @SAOptionSelected, @SAOptionValue
		, @StatusID
		, @LocationType, @LocationDefinition
		, @IsNOfDaysPlayed, @IsNOfSessioPlayed
		, @DPDateRangeFrom , @DPDateRangeTo
		, @IsDPRange ,@DPRangeFrom, @DPRangeTo
		, @IsDPOption, @DPOprtionSelected, @DPOptionValue
		, @IsSPRange, @SPRangeFrom, @SPRangeTo
		, @IsSPOption, @SPOprtionSelected, @SPOptionValue
		, @DaysOfWeekNSessionNbr
		, @IsPackageName, @PackageName
		, @AgeOptionSelected , @AgeValue 
		, @playerCount output
		;

	SET NOCOUNT OFF;

END

GO


