USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spComps_AwardPlayerComp]    Script Date: 7/19/2019 9:36:04 AM ******/
DROP PROCEDURE [dbo].[spComps_AwardPlayerComp]
GO

/****** Object:  StoredProcedure [dbo].[spComps_AwardPlayerComp]    Script Date: 7/19/2019 9:36:04 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE procedure [dbo].[spComps_AwardPlayerComp]
--=============================================================================
--	2015.04.16 jkn - Initial implementation
--  Adding support for being able to award a comp to a player
--  2015.05.19 knc - Add functionality to add to all player.
--  2015.06.25 knc - Set the lastAwardedDate for Comps table.
--  2015.07.21 jkn - Added support for returning the number of players
--      that receive a comp
--  2018.12.20 JBV - Eliminated population of CompAward's AwardedCount and 
--					 UsedCount fields (fields removed from table)
--  2018.12.27 JBV - Removed "set nocount off" statement to prevent calls 
--					 to it from messing up other procedures that call this.
--  20190719 knc - Award coupon to a player that are not banned.
--=============================================================================
    @compId int
    ,@playerId int
    , @playerCount int output

as
begin
set nocount on


	if (@playerId != 0)--Award to a single player.
	begin
	--Check if this player is banned . If exists then this player is not banned.
	If exists (select 1
	from Player tp
		left join PlayerStatus ps on ps.PlayerID = tp.PlayerID 
		left join PlayerStatusCode psc on  psc.PlayerStatusCodeID = ps.PlayerStatusCodeID
		where 
		(psc.Banned IS NULL or psc.Banned != 1)
		and tp.PlayerID = @playerId)
		BEGIN
		   insert into CompAward (CompId, PlayerId, AwardedDate)
		   values (@compId, @playerId, getdate())
		end
		;
    end
    else--Award to all player.
    begin
		insert into CompAward (CompId, PlayerId, AwardedDate)
        select @compId, tp.PlayerID, GETDATE() 
		from Player tp
		left join PlayerStatus ps on ps.PlayerID = tp.PlayerID 
		left join PlayerStatusCode psc on  psc.PlayerStatusCodeID = ps.PlayerStatusCodeID
		where 
		psc.Banned IS NULL or psc.Banned != 1
		;
    end

    set @playerCount = @@rowcount
     
   --Set The lastawardeddate
    update Comps
    set LastAwardedDate = GETDATE()
    where CompID = @compId
      
end

select * from CompAward










GO


