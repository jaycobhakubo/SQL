
USE [Daily]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRptPointAdjustment]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spRptPointAdjustment]
GO

USE [Daily]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

	CREATE proc [dbo].[spRptPointAdjustment]	
	-- ======================================
	-- Author:			Karlo Camacho
	-- Create date:		20170518
	-- Description:		Retrieves the player that has been awarded points manually or points that has been adjusted.
	-- Test: 			exec spRptPointAdjustment '2017-05-17 14:51:36', '2017-05-17 14:51:37'
	-- ======================================		
	@startDate datetime,
	@endDate datetime		
	as	
	begin		
			SELECT 
			gtTransDate [Point Adjustment Date], 
			RTRIM(LTRIM((case  when LEN(p.FirstName) > 0 then p.FirstName else '' end + ' ' + case when LEN(p.LastName) > 0 then p.LastName else '' end))) as [Player Name] , 					     		  
			ISNULL(MagneticCardNo,'') [Player Card],
			RTRIM(LTRIM((case  when LEN(s.FirstName) > 0 then s.FirstName else '' end + ' ' +  case when LEN(s.LastName) > 0 then s.LastName else '' end))) as [Staff Name] , 
			gtTransTotal [Points Adjusted] 
			
			FROM GameTrans 
				join GameTransDetail on GameTrans.gtGameTransID = GameTransDetail.gtdGameTransID
				join Player p on p.PlayerID = gtPlayerID 
				join Staff s on s.StaffID = gtStaffID				
				join PlayerMagCards pm on pm.PlayerID = gtPlayerID			
			
			WHERE
			gtRegisterReceiptID is null --Always null
				and gtGamingSession is null --Point adjustment is not bind to a session.
				and gtTransactionTypeID = 9 
				and (gtTransDate >= @startDate and gtTransDate <= @endDate)	--I can use this one as well --and (gtTransDate between @startDate and @endDate)
				--these may not be needed
				and gtModuleId is null 
				and gtGameID is null 
				and gtdPayoutReceiptNo is null 
				and gtdVoidStaffID is null
				
	 end
	
