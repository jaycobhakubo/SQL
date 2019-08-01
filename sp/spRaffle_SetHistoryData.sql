USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spRaffle_SetHistoryData]    Script Date: 8/1/2019 2:48:15 PM ******/
DROP PROCEDURE [dbo].[spRaffle_SetHistoryData]
GO

/****** Object:  StoredProcedure [dbo].[spRaffle_SetHistoryData]    Script Date: 8/1/2019 2:48:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[spRaffle_SetHistoryData]
--=============================================================================
-- Tracks the historic data of a Player Raffle
--
--  This tracks raffles that are run from either raffle location (caller or
--  Player center) and stores the appropriate data.

--(DE12855.knc.20160119) Add Player Raffle entrants per player list.
--(DE12866.knc.20160128) Error found in US4438: Generate a list of players to enter into a raffle > Drawing Entrants by Date is not correct.
-- 2019.01.21 jbv: Replaced player list detail processing code (duplicated across many procs) with call to new LoadPlayerListDetails proc
--=============================================================================
    @raffleDefinitionId int
    , @operatorId int
    , @PlayerListDefinitionID int
    , @raffleHistoryId int output    
AS
BEGIN

	SET NOCOUNT ON;

	SET @raffleHistoryId = 0;

	IF NOT EXISTS (SELECT 1 FROM PlayerRaffleDefinition WHERE RaffleDefinitionId = @raffleDefinitionId)
	BEGIN
		--=========================================================================
		-- The raffle definition does not exist so set the generic data
		--=========================================================================
		INSERT INTO PlayerRaffleHistory (OperatorId, PlayerDrawCount, RaffleStart)
		VALUES (@operatorId, 1, getdate());
        
		SET @raffleHistoryId = SCOPE_IDENTITY();
    
	END
	ELSE
	BEGIN
		--=========================================================================
		-- The raffle definition exists so we can add all of the raffle definition data to the history table
		--=========================================================================
		INSERT INTO PlayerRaffleHistory (OperatorId, PlayerDrawCount, RaffleStart, RaffleName, PrizeDescription, PrizeDisclaimer)
		SELECT OperatorId, PlayerDrawCount, getdate(), Name, PrizeDescription, PrizeDisclaimer
		FROM PlayerRaffleDefinition
		WHERE RaffleDefinitionId = @raffleDefinitionId
		;
    
		SET @raffleHistoryId = SCOPE_IDENTITY();

	END

	--===========================================================================
	-- Add all of the players that were eligible for this raffle to the history table
	--===========================================================================
	IF (@PlayerListDefinitionID = 0)
	BEGIN
		INSERT INTO PlayerRaffleHistoricEntry (RaffleHistoryId, PlayerId)
		SELECT @raffleHistoryId, PlayerId
		FROM PlayerRaffle
		WHERE OperatorId = @operatorId
		;
	END
	ELSE IF (@PlayerListDefinitionID != 0)
	BEGIN

		DECLARE @PlayerRaffleEntries TABLE
		(
			PlayerID int,
			FirstName varchar(100),
			LastName varchar(100)
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

		EXEC spLoadPlayerListDetails @PlayerListDefinitionID
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
	
		INSERT INTO @PlayerRaffleEntries (PlayerID, FirstName, LastName)
		EXEC spRptPlayerList3 @OperatorID
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
			;

	
		INSERT INTO PlayerRaffleHistoricEntry (RaffleHistoryId, PlayerId)
		SELECT @raffleHistoryId, PlayerId
		FROM @PlayerRaffleEntries
		;	
	
	END

	SET NOCOUNT OFF;

END



GO


