USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[SQLSOURCECONTROL_POPULATETABLE_Report]    Script Date: 03/27/2019 08:41:11 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLSOURCECONTROL_POPULATETABLE_Report]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[SQLSOURCECONTROL_POPULATETABLE_Report]
GO

USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[SQLSOURCECONTROL_POPULATETABLE_Report]    Script Date: 03/27/2019 08:41:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- ============================================================================
-- Author:		Landerman, Lou
-- Create date: 10/19/2017
-- Description:	Populates Table Reports
-- Report Types
-- 1 = Sales	6 = Special		11 = Tax Forms		16 = Texas
-- 2 = Paper	7 = Bingo		12 = Gaming			17 = Coupon
-- 3 = Player	8 = Electronics 13 = Inventory		18 = B3
-- 4 = Misc		9 = Exceptions	14 = Progressives	19 = Session Summary
-- 5 = Staff	10 = Customer	15 = Payouts		20 = Presales
--
-- 2019.01.22 jkn: Added common ReportId and ReportName variables to help 
--      prevent errors.
-- 2019.03.27 (knc)REINSERT ALL REPORT FILE - report file Id is out of sync to devserver
-- ============================================================================
CREATE PROCEDURE [dbo].[SQLSOURCECONTROL_POPULATETABLE_Report]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- REINSERT ALL REPORT FILE - report file Id is out of sync to devserver
	
	
	If ((select COUNT(*) from Reports) > 1 )
	BEGIN
	
		TRUNCATE TABLE dbo.ReportDefinitions
			DBCC CHECKIDENT ('dbo.ReportDefinitions', RESEED, 0);  
		TRUNCATE TABLE dbo.ReportLocalizations
			DBCC CHECKIDENT ('dbo.ReportLocalizations', RESEED, 0);  	
		
		alter table dbo.ReportGroupLink	drop constraint FK_ReportGroupLink_Report
		
			
		DELETE FROM Reports
			DBCC CHECKIDENT ('dbo.Reports', RESEED, 0); 
					
		--select * from ReportGroupLink
		--select * from Reports
			 
	END

    DECLARE @ReportName nvarchar(128);
    SET @ReportName = N'';
 
	-- 1
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CreditBalancesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,0,'CreditBalancesReport.rpt')
	END

	-- 2
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CrystalBallBingoSalesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'CrystalBallBingoSalesReport.rpt')
	END

	-- 3
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BallCallReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,1,'BallCallReport.rpt')
	END
	
	-- 4
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused1 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused1 ***')
	END

	-- 5
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused2 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused2 ***')
	END

	-- 6
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'AuthorizedNetworkDevices.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'AuthorizedNetworkDevices.rpt')
	END

	-- 7
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'MachineStatusReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'MachineStatusReport.rpt')
	END

	-- 8
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'StaffReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(5,1,'StaffReport.rpt')
	END

	-- 9
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerList.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'PlayerList.rpt')
	END

	-- 10
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerListDetail.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerListDetail.rpt')
	END

	-- 11
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerLoyaltyList.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,0,'PlayerLoyaltyList.rpt')
	END

	-- 12
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'POSRegisterSalesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'POSRegisterSalesReport.rpt')
	END

	-- 13
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PointLiability.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PointLiability.rpt')
	END

	-- 14
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'POSMenuReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,'POSMenuReport.rpt')
	END

	-- 15
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ProgramReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,'ProgramReport.rpt')
	END

	-- 16
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoCardDetailReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BingoCardDetailReport.rpt')
	END

	-- 17
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SalesByDeviceTotals.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'SalesByDeviceTotals.rpt')
	END

	-- 18
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SalesTotals.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SalesTotals.rpt')
	END

	-- 19
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerMailingLabels.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'PlayerMailingLabels.rpt')
	END

	-- 20
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterDetail.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterDetail.rpt')
	END

	-- 21
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'VIPSalesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'VIPSalesReport.rpt')
	END

	-- 22
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'WinnersReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,1,'WinnersReport.rpt')
	END

	-- 23
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'UnplayedPacksReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'UnplayedPacksReport.rpt')
	END

	-- 24
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoCardSummaryReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BingoCardSummaryReport.rpt')
	END
	
	-- 25
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused3 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused3 ***')
	END
	
	-- 26
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused4 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused4 ***')
	END
	
	-- 27
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused5 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused5 ***')
	END
	
	-- 28
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused6 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused6 ***')
	END
	
	-- 29
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused7 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused7 ***')
	END
	
	-- 30
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused8 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused8 ***')
	END
	
	-- 31
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused9 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused9 ***')
	END

	-- 32
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ExportPlayList.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'ExportPlayList.rpt')
	END

	-- 33
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Form1042-S.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(11,1,'Form1042-S.rpt')
	END

	-- 34
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'FormW2G.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(11,1,'FormW2G.rpt')
	END
	
	-- 35
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused10 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused10 ***')
	END
	
	-- 36
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused11 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused11 ***')
	END
	
	-- 37
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused12 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused12 ***')
	END
	
	-- 38
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused13 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused13 ***')
	END
	
	-- 39
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused14 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused14 ***')
	END
	
	-- 40
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused15 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused15 ***')
	END
	
	-- 41
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused16 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused16 ***')
	END
	
	-- 42
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused17 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused17 ***')
	END
	
	-- 43
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused18 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused18 ***')
	END
	
	-- 44
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerCreditUsageReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,0,'PlayerCreditUsageReport.rpt')
	END

	-- 45
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerSpendReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerSpendReport.rpt')
	END

	-- 46
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PointsEarned.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,0,'PointsEarned.rpt')
	END

	-- 47
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused19 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused19 ***')
	END
	
	-- 48
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused20 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused20 ***')
	END
	
	-- 49
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused21 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused21 ***')
	END
	
	-- 50
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SalesByPackageTotals.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SalesByPackageTotals.rpt')
	END
	
	-- 51
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused22 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused22 ***')
	END
	
	-- 52
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused23 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused23 ***')
	END
	
	-- 53
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused24 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused24 ***')
	END
	
	-- 54
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused25 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused25 ***')
	END
	
	-- 55
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused26 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused26 ***')
	END

	-- 56
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SystemEvents.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(9,0,'SystemEvents.rpt')
	END

	-- 57
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Product.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,'Product.rpt')
	END
	
	-- 58
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused27 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused27 ***')
	END
	
	-- 59
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused28 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused28 ***')
	END

	-- 60
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'TaxFormSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(11,0,'TaxFormSummary.rpt')
	END

	-- 61
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CashActivityReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,'CashActivityReport.rpt')
	END

	-- 62
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CashierDailyTotalsReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'CashierDailyTotalsReport.rpt')
	END

	-- 63
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'MiniRegisterSalesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'MiniRegisterSalesReport.rpt')
	END

	-- 64
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PNPGames.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,0,'PNPGames.rpt')
	END

	-- 65
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PNPGamesDetail.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,0,'PNPGamesDetail.rpt')
	END

	-- 66
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CrystalBallPlayItSheetCards.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'CrystalBallPlayItSheetCards.rpt')
	END
	--ELSE
	--BEGIN
	--	UPDATE [Reports] SET [ReportTypeID] = 6,[ReportFileName] = 'CrystalBallPlayItSheetCards.rpt' WHERE [ReportFileName] = 66;
	--END

	-- 67
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CrystalBallPlayItSheetLines.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'CrystalBallPlayItSheetLines.rpt')
	END

	-- 68
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerRaffleWinners.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerRaffleWinners.rpt')
	END

	-- 69
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'QuantitySalesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'QuantitySalesReport.rpt')
	END
	
	-- 70
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused29 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused29 ***')
	END

	-- 71
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'UnitTransferReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'UnitTransferReport.rpt')
	END

	-- 72
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterSalesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterSalesReport.rpt')
	END
	
	-- 73
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused30 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused30 ***')
	END

	-- 74
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'MichiganQuarterlyReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'MichiganQuarterlyReport.rpt')
	END

	-- 75
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'DoorSalesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'DoorSalesReport.rpt')
	END

	-- 76
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CrystalBallBingoSalesReportSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'CrystalBallBingoSalesReportSummary.rpt')
	END
	
	-- 77
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Test ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Test ***')
	END

	-- 78
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoEquipmenlogrpt.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'BingoEquipmenlogrpt.rpt')
	END

	-- 79
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoDoorCount.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'BingoDoorCount.rpt')
	END

	-- 80
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoCoverallRecord.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'BingoCoverallRecord.rpt')
	END

	-- 81
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoWeeklyCashAccountability.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'BingoWeeklyCashAccountability.rpt')
	END

	-- 82
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ColoradoQuarterly.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'ColoradoQuarterly.rpt')
	END

	-- 83
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PayoutWorksheet.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'PayoutWorksheet.rpt')
	END

	-- 84
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoPayoutReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'BingoPayoutReport.rpt')
	END

	-- 85
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoOccasionActivitySummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'BingoOccasionActivitySummary.rpt')
	END

	-- 86
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'LastSalePullTab.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'LastSalePullTab.rpt')
	END

	-- 87
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SummaryOfPulltabActivity.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'SummaryOfPulltabActivity.rpt')
	END

	-- 88
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SpecialsReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'SpecialsReport.rpt')
	END

	-- 89
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InstantBingoCardPurchaseLog.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'InstantBingoCardPurchaseLog.rpt')
	END

	-- 90
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CashDisbursements Journal2.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'CashDisbursements Journal2.rpt')
	END

	-- 91
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CashDisbursements Journal.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'CashDisbursements Journal.rpt')
	END

	-- 92
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'DisposableCardSalesSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'DisposableCardSalesSummary.rpt')
	END

	-- 93
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryRecapandVerification.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'InventoryRecapandVerification.rpt')
	END

	-- 94
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoGiftCertificateLog.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'BingoGiftCertificateLog.rpt')
	END

	-- 95
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InstantBingoInventory.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'InstantBingoInventory.rpt')
	END

	-- 96
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'LessorReceiptsJournal.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'LessorReceiptsJournal.rpt')
	END

	-- 97
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'OccasionScheduleofPrizes.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'OccasionScheduleofPrizes.rpt')
	END

	-- 98
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'OccasionCashReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'OccasionCashReport.rpt')
	END

	-- 99
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SalesJournal.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'SalesJournal.rpt')
	END

	-- 100
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'DailyFloorSalesByUsherShort.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'DailyFloorSalesByUsherShort.rpt')
	END

	-- 101
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'DailyFloorSalesByUsher.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'DailyFloorSalesByUsher.rpt')
	END

	-- 102
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CharityGameTicketReconciliation.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'CharityGameTicketReconciliation.rpt')
	END

	-- 103
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CharityGameTicketAccountability.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'CharityGameTicketAccountability.rpt')
	END

	-- 104
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'WorkersServiceRecord.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'WorkersServiceRecord.rpt')
	END

	-- 105
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'MichiganProgressiveJackpotCoverallRecord.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'MichiganProgressiveJackpotCoverallRecord.rpt')
	END

	-- 106
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'DisposableBingoCardAccountability.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'DisposableBingoCardAccountability.rpt')
	END

	-- 107
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoPrizePayoutLog.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'BingoPrizePayoutLog.rpt')
	END

	-- 108
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'DisposableBingoCardMonthlyInventory.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'DisposableBingoCardMonthlyInventory.rpt')
	END

	-- 109
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'MichiganProgressiveJackpotBingoGame.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(10,0,'MichiganProgressiveJackpotBingoGame.rpt')
	END

	-- 110
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'NightlyInventoryReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,0,'NightlyInventoryReport.rpt')
	END

	-- 111
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,0,'InventoryReport.rpt')
	END

	-- 112
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryByLocationReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,0,'InventoryByLocationReport.rpt')
	END

	-- 113
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryInvoiceReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,0,'InventoryInvoiceReport.rpt')
	END

	-- 114
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryAuditReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,0,'InventoryAuditReport.rpt')
	END

	-- 115
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryAdjustmentsReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,0,'InventoryAdjustmentsReport.rpt')
	END

	-- 116
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryIssueSummaryReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,0,'InventoryIssueSummaryReport.rpt')
	END

	-- 117
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryIssueClerkReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,0,'InventoryIssueClerkReport.rpt')
	END

	-- 118
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PullTabTheoreticalHoldReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,0,'PullTabTheoreticalHoldReport.rpt')
	END

	-- 119
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CrystalBallPlayItSheetCardsThermal.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'CrystalBallPlayItSheetCardsThermal.rpt')
	END

	-- 120
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CrystalBallPlayItSheetLinesThermal.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'CrystalBallPlayItSheetLinesThermal.rpt')
	END

	-- 121
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryIssueDetail.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryIssueDetail.rpt')
	END

	-- 122
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryTransaction.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryTransaction.rpt')
	END

	-- 123
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'DailyInventoryMovement.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'DailyInventoryMovement.rpt')
	END

	-- 124
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterClosingReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterClosingReport.rpt')
	END

	-- 125
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'MiniRegisterClosingReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'MiniRegisterClosingReport.rpt')
	END

	-- 126
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'DoorSalesReportMichigan.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'DoorSalesReportMichigan.rpt')
	END

	-- 127
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InvCenterOnHand.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InvCenterOnHand.rpt')
	END
	
	-- 128
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused31 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused31 ***')
	END
	
	-- 129
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused32 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused32 ***')
	END
	
	-- 130
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused33 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused33 ***')
	END

	--IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'AccrualsActivityByAccount.rpt')
	--BEGIN
	--	INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,0,'AccrualsActivityByAccount.rpt')
	--END

	--IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'AccrualsBalancesReport.rpt')
	--BEGIN
	--	INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,0,'AccrualsBalancesReport.rpt')
	--END

	--IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'AccrualsDetailsReport.rpt')
	--BEGIN
	--	INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,0,'AccrualsDetailsReport.rpt')
	--END
	
	-- 131
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SessionSummaryReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(19,1,'SessionSummaryReport.rpt')
	END

	-- 132
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryPhysicalCount.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryPhysicalCount.rpt')
	END
	
	-- 133
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused34 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused34 ***')
	END

	-- 134
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PrizeCheckReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(15,1,'PrizeCheckReport.rpt')
	END

	-- 135
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoRevenueSummaryAccrualBased.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,1,'BingoRevenueSummaryAccrualBased.rpt')
	END

	-- 136
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoRevenueSummaryCashBased.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,1,'BingoRevenueSummaryCashBased.rpt')
	END

	-- 137
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'GameAnalysisReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,0,'GameAnalysisReport.rpt')
	END

	-- 138
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventorySkipsReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventorySkipsReport.rpt')
	END
	
	-- 139
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused35 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused35 ***')
	END

	-- 140
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerPointsEarned.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerPointsEarned.rpt')
	END

	-- 141
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PayoutDetailReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(15,1,'PayoutDetailReport.rpt')
	END

	-- 142
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'StaffLogonReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(5,0,'StaffLogonReport.rpt')
	END
	
	-- 143
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused36 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused36 ***')
	END
	
	IF EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'AccrualSettingChanges.rpt')
	BEGIN
		UPDATE [Reports]
		SET [ReportFileName] = '*** Unused143 ***'
		WHERE [ReportFileName] = 'AccrualSettingChanges.rpt'
	END

	--IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'AccrualSettingChanges.rpt')
	--BEGIN
	--	INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,0,'AccrualSettingChanges.rpt')
	--END

	-- 144
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BallCallFrequency.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,1,'BallCallFrequency.rpt')
	END

	-- 145
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PositionPermissionDetail.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'PositionPermissionDetail.rpt')
	END

	-- 146
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PositionPermissionSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'PositionPermissionSummary.rpt')
	END
	
	-- 147
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused37 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused37 ***')
	END
	
	-- 148
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused38 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused38 ***')
	END
	
	-- 149
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused39 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused39 ***')
	END
	
	-- 150
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused40 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused40 ***')
	END
	
	-- 151
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused41 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused41 ***')
	END

	-- 152
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryAuditDetail.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryAuditDetail.rpt')
	END
	
	-- 153
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused42 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused42 ***')
	END

	-- 154
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SettingsChangedReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(9,0,'SettingsChangedReport.rpt')
	END

	-- 155
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SessionHistory.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(9,1,'SessionHistory.rpt')
	END

	-- 156
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ElectronicDeviceHistoryReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'ElectronicDeviceHistoryReport.rpt')
	END

	-- 157
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ExceptionDetail.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(9,1,'ExceptionDetail.rpt')
	END

	-- 158
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SystemPermissionsReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(5,1,'SystemPermissionsReport.rpt')
	END

	-- 159
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ElectronicUsageFeesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'ElectronicUsageFeesReport.rpt')
	END

	-- 160
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerRedemptionReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerRedemptionReport.rpt')
	END

	-- 161
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'AuditReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(9,1,'AuditReport.rpt')
	END

	-- 162
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ElectronicSalesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'ElectronicSalesReport.rpt')
	END

	-- 163
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SessionSummaryRecap.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SessionSummaryRecap.rpt')
	END

	-- 164
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PaperIssueSummaryByStaffReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'PaperIssueSummaryByStaffReport.rpt')
	END

	-- 165
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ElectronicBingoCardSalesReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'ElectronicBingoCardSalesReport.rpt')
	END

	-- 166
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PaperBingoSales.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'PaperBingoSales.rpt')
	END

	-- 167
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoGameVerificationReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,1,'BingoGameVerificationReport.rpt')
	END

	-- 168
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RaffleEntrants.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'RaffleEntrants.rpt')
	END

	-- 169
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'NewPlayer.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'NewPlayer.rpt')
	END

	-- 170
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoCardSummaryReportByProduct.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BingoCardSummaryReportByProduct.rpt')
	END
	
	-- 171
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused43 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused43 ***')
	END
	
	-- 172
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused44 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused44 ***')
	END
	
	-- 173
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused45 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused45 ***')
	END

	-- 174
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PointSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PointSummary.rpt')
	END

	-- 175
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CrystalBallPlayItSheetVerticalLinesThermal.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(6,1,'CrystalBallPlayItSheetVerticalLinesThermal.rpt')
	END
	
	-- 176
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused46 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused46 ***')
	END

	-- 177
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ProductPurchased.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'ProductPurchased.rpt')
	END

	-- 178
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'W2GTaxFormRecipients.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(11,1,'W2GTaxFormRecipients.rpt')
	END

	-- 179
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '1042STaxFormRecipients.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(11,1,'1042STaxFormRecipients.rpt')
	END

	-- 180
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Occasion.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(16,0,'Occasion.rpt')
	END

	-- 181
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'OccasionSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(16,0,'OccasionSummary.rpt')
	END

	-- 182
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'OccasionLog.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(16,0,'OccasionLog.rpt')
	END

	-- 183
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SalesByProduct.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SalesByProduct.rpt')
	END

	-- 184
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerPointsEarnedSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerPointsEarnedSummary.rpt')
	END

	-- 185
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerWin.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerWin.rpt')
	END

	-- 186
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerSpendWinSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerSpendWinSummary.rpt')
	END

	-- 187
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'MenuCardCount.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,'MenuCardCount.Rpt')
	END
	
	-- 188
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = '*** Unused47 ***')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'*** Unused47 ***')
	END

	-- 189
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PayoutSummaryReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(15,1,'PayoutSummaryReport.rpt')
	END

	-- 190
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BankTransactions.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,'BankTransactions.rpt')
	END

	-- 191
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryIssueSummaryByProduct.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryIssueSummaryByProduct.rpt')
	END

	-- 192
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'TransactionSessionSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'TransactionSessionSummary.rpt')
	END

	-- 193
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PaperInventoryRetiredOnly.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'PaperInventoryRetiredOnly.Rpt')
	END

	-- 194
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PaperInventoryNotRetired.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'PaperInventoryNotRetired.Rpt')
	END

	-- 195
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PaperInventoryNotInPlay.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'PaperInventoryNotInPlay.Rpt')
	END

	-- 196
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PaperInventoryInPlay.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'PaperInventoryInPlay.Rpt')
	END

	-- 197
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventorySalesBySerialNumber.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventorySalesBySerialNumber.Rpt')
	END

	-- 198
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventorySalesByProduct.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventorySalesByProduct.Rpt')
	END

	-- 199
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryRegisterComparison.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryRegisterComparison.Rpt')
	END

	-- 200
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryNightly.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryNightly.Rpt')
	END

	-- 201
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryInUseToday.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryInUseToday.Rpt')
	END

	-- 202
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryEntryByInvoice.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryEntryByInvoice.Rpt')
	END

	-- 203
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Inventory.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'Inventory.Rpt')
	END

	-- 204
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'DistributorFeesSummary.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'DistributorFeesSummary.Rpt')
	END

	-- 205
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'DistributorFees.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'DistributorFees.Rpt')
	END

	-- 206
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoGameAnalysis.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,1,'BingoGameAnalysis.rpt')
	END

	-- 207
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterSalesByStaff.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterSalesByStaff.rpt')
	END

	-- 208
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterSalesByProductType.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterSalesByProductType.rpt')
	END

	-- 209
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterSalesByProductGroup.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterSalesByProductGroup.rpt')
	END

	-- 210
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterSalesByProduct.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterSalesByProduct.rpt')
	END

	-- 211
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterSalesByPackage.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterSalesByPackage.rpt')
	END

	-- 212
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterSalesByGameCategory.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterSalesByGameCategory.rpt')
	END

	-- 213
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterSalesByDiscount.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterSalesByDiscount.rpt')
	END

	-- 214
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerSpendTop100.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerSpendTop100.rpt')
	END

	-- 215
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerSpendTop50.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerSpendTop50.rpt')
	END

	-- 216
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerSpendTop10.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerSpendTop10.rpt')
	END

	-- 217
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PaperAuditSeriesUsage.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'PaperAuditSeriesUsage.rpt')
	END

	-- 218
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PaperAuditByDate.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'PaperAuditByDate.rpt')
	END

	-- 219
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CashActivitySummaryReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,'CashActivitySummaryReport.rpt')
	END

	-- 220
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SessionIssue.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'SessionIssue.rpt')
	END

	-- 221
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RaffleEntrantsByDate.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'RaffleEntrantsByDate.rpt')
	END

	-- 222
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'OccasionReportByPackage.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(16,0,'OccasionReportByPackage.rpt')
	END

	-- 223
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SalesByProductGrpDateSession.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SalesByProductGrpDateSession.rpt')
	END

	-- 224
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'NorthDakotaSessionSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,'NorthDakotaSessionSummary.rpt')
	END

	-- 225
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InvoicesSkips.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InvoicesSkips.Rpt')
	END

	-- 226
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InvoiceHistory.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InvoiceHistory.Rpt')
	END

	-- 227
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryRetired.Rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryRetired.Rpt')
	END

	-- 228
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryEntry.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryEntry.rpt')
	END

	-- 229
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BarcodedPaperScans.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BarcodedPaperScans.rpt')
	END

	-- 230
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BarcodedPaperSalesSummaryByDateStaff.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BarcodedPaperSalesSummaryByDateStaff.rpt')
	END

	-- 231
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BarcodedPaperSalesSummaryByDateSessionStaff.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BarcodedPaperSalesSummaryByDateSessionStaff.rpt')
	END

	-- 232
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BarcodedPaperSalesSummaryByDateSession.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BarcodedPaperSalesSummaryByDateSession.rpt')
	END

	-- 233
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BarcodedPaperSalesSkipsByDateSessionStaff.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BarcodedPaperSalesSkipsByDateSessionStaff.rpt')
	END

	-- 234
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BarcodedPaperSalesSkips.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BarcodedPaperSalesSkips.rpt')
	END

	-- 235
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BarcodedPaperSalesHistoryBySerialSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BarcodedPaperSalesHistoryBySerialSummary.rpt')
	END

	-- 236
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BarcodedPaperSalesHistoryBySerial.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BarcodedPaperSalesHistoryBySerial.rpt')
	END

	-- 237
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BarcodedPaperSalesDetail.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'BarcodedPaperSalesDetail.rpt')
	END

	-- 238
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CouponUsage.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(17,1,'CouponUsage.rpt')
	END

	-- 239
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_AccountsReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_AccountsReport.rpt')
	END

	-- 240
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_DailyReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_DailyReport.rpt')
	END

	-- 241
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_DetailReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_DetailReport.rpt')
	END

	-- 242
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_MonthlyReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_MonthlyReport.rpt')
	END

	-- 243
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_VoidReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_VoidReport.rpt')
	END

	-- 244
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_DrawerReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_DrawerReport.rpt')
	END

	-- 245
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_JackpotReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_JackpotReport.rpt')
	END

	-- 246
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_SessionReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_SessionReport.rpt')
	END

	-- 247
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_BallCallbySession.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_BallCallbySession.rpt')
	END

	-- 248
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_BallCall.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_BallCall.rpt')
	END

	-- 249
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_SessionTransaction.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_SessionTransaction.rpt')
	END

	-- 250
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_SessionSummary2.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_SessionSummary2.rpt')
	END

	-- 251
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_WinnerCardsReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_WinnerCardsReport.rpt')
	END

	-- 252
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_AccountHistory.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_AccountHistory.rpt')
	END
	
	-- 253
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerClubPoints.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerClubPoints.rpt')
	END

	-- 254
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ProgressiveJackpotCalendar.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,1,'ProgressiveJackpotCalendar.rpt')
	END

	-- 255
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SouthPointSessionSummaryRecapNoPercentages.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'SouthPointSessionSummaryRecapNoPercentages.rpt')
	END

	-- 256
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SouthPointProgressiveSales.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,0,'SouthPointProgressiveSales.rpt')
	END

	-- 257
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SouthPointProgressiveJackpotCalendar.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,0,'SouthPointProgressiveJackpotCalendar.rpt')
	END

	-- 258
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SouthPointBallCallReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,0,'SouthPointBallCallReport.rpt')
	END

	-- 259
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Shift4EndOfDay.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,0,'Shift4EndOfDay.rpt')
	END

	-- 260
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SessionSummaryRecapDaily.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SessionSummaryRecapDaily.rpt')
	END

	-- 261
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SessionSummaryRecapCashBased.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SessionSummaryRecapCashBased.rpt')
	END

	-- 262
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ProgressiveActivityByAccount.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,1,'ProgressiveActivityByAccount.rpt')
	END

	-- 263
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ProductSales.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'ProductSales.rpt')
	END

	-- 264
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ElectronicUsageFeesSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,1,'ElectronicUsageFeesSummary.rpt')
	END

	-- 265
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CashActivityCashMethodPOS.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,'CashActivityCashMethodPOS.rpt')
	END

	-- 266
	--IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Acc2ConfigurationReport.rpt')
	--BEGIN
	--	INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,0,'Acc2ConfigurationReport.rpt')
	--END

	-- 267
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Acc2AccountConfigReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,1,'Acc2AccountConfigReport.rpt')
	END

	-- 268
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Acc2AccrualConfigReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,1,'Acc2AccrualConfigReport.rpt')
	END

	-- 269
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'StationsSessionSummaryRecapDaily.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'StationsSessionSummaryRecapDaily.rpt')
	END

	-- 270
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'StationsSessionSummaryRecap.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'StationsSessionSummaryRecap.rpt')
	END

	-- 271
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'StationsProgressiveJackpotCalendar.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,0,'StationsProgressiveJackpotCalendar.rpt')
	END

	-- 272
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SouthPointProgressivePayouts.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(15,0,'SouthPointProgressivePayouts.rpt')
	END

	-- 273
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'JerrysSessionSummaryRecapCashBased.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'JerrysSessionSummaryRecapCashBased.rpt')
	END

	-- 274
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'JerrysSessionSummaryRecap.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'JerrysSessionSummaryRecap.rpt')
	END

	-- 275
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BlowerLog.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,1,'BlowerLog.rpt')
	END

	-- 276
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Acc2AccrualConfigReportSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,1,'Acc2AccrualConfigReportSummary.rpt')
	END

	-- 277
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BurnsideDailyRecap.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,0,'BurnsideDailyRecap.rpt')
	END

	-- 278
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CannerySessionSummaryRecap.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'CannerySessionSummaryRecap.rpt')
	END

	-- 279
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CannerySessionSummaryRecapCashBased.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'CannerySessionSummaryRecapCashBased.rpt')
	END

	-- 280
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CannerySessionSummaryRecapDaily.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'CannerySessionSummaryRecapDaily.rpt')
	END

	-- 281
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryExceptions.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(9,1,'InventoryExceptions.rpt')
	END

	-- 282
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InvCenterOnHandHistorical.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InvCenterOnHandHistorical.rpt')
	END

	-- 283
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'ManualPlayerPointAdjustments.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'ManualPlayerPointAdjustments.rpt')
	END

	-- 284
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerAttendance.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerAttendance.rpt')
	END

	-- 285
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerSpendByDate.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerSpendByDate.rpt')
	END

	-- 287
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PlayerWinByDate.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'PlayerWinByDate.rpt')
	END

	-- 288
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SalesByStaff.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SalesByStaff.rpt')
	END

	-- 289
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SessionSummaryRecapCashBasedSessionTotals.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SessionSummaryRecapCashBasedSessionTotals.rpt')
	END

	-- 290
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Validations.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'Validations.rpt')
	END

	-- 291
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SecuritySettings.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,'SecuritySettings.rpt')
	END

	-- 292
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'TotalPointLiability.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,1,'TotalPointLiability.rpt')
	END

	-- 293
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'JumboSalesPayouts.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,0,'JumboSalesPayouts.rpt')
	END
	
	-- 294
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'B3_BingoCardReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(18,1,'B3_BingoCardReport.rpt')
	END

    -- Update all of the Session Summary Reports to use the appropriate Session Summary Report Type id
    UPDATE [Reports] SET [ReportTypeID] = 19 WHERE [ReportFileName] LIKE '%SessionSummaryReport%' AND [ReportTypeID] != 19

	-- 295
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BingoRevenueSummaryModifiedAccrualBased.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(7,1,'BingoRevenueSummaryModifiedAccrualBased.rpt')
	END

	-- 296	--	US5599
	IF EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Presales.rpt')
	BEGIN
		UPDATE [Reports] SET [ReportTypeID] = 20 WHERE [ReportFileName] = 'Presales.rpt'
	END
	
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Presales.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(20,1,'Presales.rpt')
	END
	
	-- 297	-- US5560
	IF EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PresalesPlayDate.rpt')
	BEGIN
		UPDATE [Reports] SET [ReportTypeID] = 20 WHERE [ReportFileName] = 'PresalesPlayDate.rpt'
	END
	
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PresalesPlayDate.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(20,1,'PresalesPlayDate.rpt')
	END

	-- 298	US5617
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CouponsAwarded.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(17,1,'CouponsAwarded.rpt')
	END

	-- 299	US5616
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Coupons.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(17,1,'Coupons.rpt')
	END

	-- 300	US5618
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Discounts.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(17,1,'Discounts.rpt')
	END
	
	-- 301	US5635
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BusSales.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'BusSales.rpt')
	END
	
	-- 302	US5637
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'InventoryUsageSummary.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(13,1,'InventoryUsageSummary.rpt')
	END
	
	-- 303	Sales report
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SalesGroupedByProductType.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SalesGroupedByProductType.rpt')
	END
	
	-- 304	Payouts report
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PayoutSummaryCompact.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(15,1,'PayoutSummaryCompact.rpt')
	END
	
	-- 305	Accual Calendar
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'AccrualCalendar.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(14,1,'AccrualCalendar.rpt')
	END
	
	-- 306	Boyd Session Summary Recap Cash Based
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BoydSessionSummaryRecapCashBased.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'BoydSessionSummaryRecapCashBased.rpt')
	END
	
	-- 307 Cash Activity Detail 
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CashActivityDetailReport.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,0,'CashActivityDetailReport.rpt')
	END
	
	-- 308 Boyd Session Summary Recap Daily
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'BoydSessionSummaryRecapDaily.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,0,'BoydSessionSummaryRecapDaily.rpt')
	END
	
	-- 309 Golden Gaming Comps
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'Comps.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(17,0,'Comps.rpt')
	END
	
	-- 310 Session Summary Recap - Daily Cash Based
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SessionSummaryRecapCashBasedDailyTotals.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'SessionSummaryRecapCashBasedDailyTotals.rpt')
	END
	
	-- 311 Overall Point Liability
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'OverallPointLiability.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(3,0,'OverallPointLiability.rpt')
	END
	
	-- 312 Presales Reconciliation
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PresalesReconciliation.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(20,1,'PresalesReconciliation.rpt')
	END
	
	-- 313 Session Cash Drop
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'SessionCashDrop.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,0,'SessionCashDrop.rpt')
	END
	
	-- 314 Register Transactions US5734
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'RegisterTransactions.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(1,1,'RegisterTransactions.rpt')
	END
	
	-- 315 Presales Back-In US5728
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PresalesBackIn.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(20,1,'PresalesBackIn.rpt')
	END
	
	-- 316 Presales Detail US5730
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'PresalesDetail.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(20,1,'PresalesDetail.rpt')
	END
	
	-- 317 Card Level Distribution US5738
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = 'CardLevelDistribution.rpt')
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,0,'CardLevelDistribution.rpt')
	END
	
	-- 318 Expired Presales US5742
    SET @ReportName = 'ExpiredPresales.rpt';
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = @ReportName)
 	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(20,1,@ReportName)
 	END
	
	-- 319 Payouts By Level US5746
    SET @ReportName = 'PayoutsByLevel.rpt';
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = @ReportName)
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(15,1,@ReportName)
	END
	
	-- 320 FortuNet Unit Usage Arizona Charlies US5757
    SET @ReportName = 'FortunetUnitUsageAZCharlies.rpt';
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = @ReportName)
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,0,@ReportName)
	END
	
	-- 321 FortuNet Unit Usage 
    SET @ReportName = 'FortunetUnitUsage.rpt';
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = @ReportName)
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(8,0,@ReportName)
	END
	-- 322 Player Coupon Availability
    SET @ReportName = 'CouponPlayerAvailability.rpt';
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = @ReportName)
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(17,1,@ReportName)
	END
	-- 323 Coupon Criteria -- Report was created in 2015 but is missing in the populate sp 
    SET @ReportName = 'CouponCriteria.rpt';
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = @ReportName)
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(17,1,@ReportName)
	END
	-- 324 Packages -- Report was created years ago but was not added to the reports table.
    SET @ReportName = 'Packages.rpt';
	IF NOT EXISTS (SELECT 1 FROM [Reports] WHERE [ReportFileName] = @ReportName)
	BEGIN
		INSERT INTO [Reports] ([ReportTypeID],[IsActive],[ReportFileName])VALUES(4,1,@ReportName)
	END
	
	ALTER TABLE [dbo].[ReportGroupLink]   ADD  CONSTRAINT [FK_ReportGroupLink_Report] FOREIGN KEY([ReportID]) REFERENCES [dbo].[Reports] ([ReportID])
	
END

GO


