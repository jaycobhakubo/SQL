USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spComps_AwardGroupPlayerComps]    Script Date: 06/05/2019 11:42:53 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spComps_AwardGroupPlayerComps]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spComps_AwardGroupPlayerComps]
GO

USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spComps_AwardGroupPlayerComps]    Script Date: 06/05/2019 11:42:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE  proc  [dbo].[spComps_AwardGroupPlayerComps]
(
--=============================================================================
-- 2015.07.20 Adding support for calling spRptPlayerList for retrieving the
--  list of players that are to receive the giving coupon
-- 20180409 tmp: DE14053 Filtering by Number of Sessions Played was not working.
--               Flag @IsNOfSessioPlayed was not set to 1 when the session parameters were set. 
-- 20181220 JBV: Eliminated population of CompAward's AwardedCount and UsedCount fields (fields removed from table)
-- 2019.01.21 jbv: Replaced player list detail processing code (duplicated across many procs) 
--                 with call to new LoadPlayerListDetails proc
-- 2019.06.19 knc: Added to support a group of player by age
--=============================================================================
    @operatorId int
    ,@definitionId int
    ,@compId int
    ,@playersAffected int output
)
as
BEGIN

	SET NOCOUNT ON;

	DECLARE @PlayerList TABLE
	(
	  PlayerID int
	  ,FirstName nvarchar(32)   
	  ,MiddleInitial nvarchar(4)   
	  ,LastName nvarchar(32)   
	  ,Birthdate datetime
	  ,Email nvarchar(200)   
	  ,Gender nvarchar(4)  
	  ,Address1 nvarchar(64)   
	  ,Address2 nvarchar(64)   
	  ,City nvarchar(32)   
	  ,State nvarchar(32)   
	  ,Country nvarchar(32)   
	  ,Zip nvarchar(32)  
	  ,Refundable money   
	  ,NonRefundable money  
	  ,LastVisitDate datetime
	  ,PointsBalance money   
	  ,Spend money   
	  ,AvgSpend money  
	  ,Visits int  
	  ,StatusName nvarchar(1000)
	  ,OperatorID int  
	  ,GovIssuedIdNum nvarchar(48)
	  ,PlayerIdent nvarchar(64)
	  ,Phone nvarchar(64)
	  ,JoinDate datetime
	  ,Comment nvarchar(510)
	  ,MagCardNo nvarchar(64)
	  ,NDaysPlayed int
	  ,NSessionPlayed int    	
	  ,GamingDate datetime
	  ,SessionNbr int
	  ,[Days] varchar(10)
	);

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
		, @AgeOptionSelected  OUTPUT
		, @AgeValue  OUTPUT 
		;	

	INSERT INTO @PlayerList(PlayerID, FirstName, MiddleInitial, LastName, Birthdate, Email, Gender, Address1, Address2, City, State, Country, Zip
		, Refundable, NonRefundable, LastVisitDate, PointsBalance, Spend, AvgSpend, Visits, StatusName, OperatorID
		, GovIssuedIdNum, PlayerIdent, Phone, JoinDate, Comment, MagCardNo, NDaysPlayed, NSessionPlayed, GamingDate, SessionNbr, [Days])
	EXEC spRptPlayerList @OperatorID
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
		, @DPDateRangeFrom, @DPDateRangeTo
		, @IsDPRange, @DPRangeFrom, @DPRangeTo
		, @IsDPOption, @DPOprtionSelected, @DPOptionValue
		, @IsSPRange, @SPRangeFrom, @SPRangeTo
		, @IsSPOption, @SPOprtionSelected, @SPOptionValue
		, @DaysOfWeekNSessionNbr
		, @IsPackageName, @PackageName
		, @AgeOptionSelected ,@AgeValue 
		
		;

	-- Award comps
	INSERT INTO CompAward (CompId, PlayerId, AwardedDate)
	SELECT @compId, PlayerId, getdate()
	FROM @PlayerList
	ORDER BY PlayerId
	;

	SET @playersAffected = @@rowcount;

	-- Set The lastawardeddate
    UPDATE Comps
    SET LastAwardedDate = GETDATE()
    WHERE CompID = @compId
	;

	SET NOCOUNT OFF;

END


GO


