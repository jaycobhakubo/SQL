USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spB3_GetB3SettingValue]    Script Date: 10/31/2019 3:39:48 PM ******/
DROP PROCEDURE [dbo].[spB3_GetB3SettingValue]
GO

/****** Object:  StoredProcedure [dbo].[spB3_GetB3SettingValue]    Script Date: 10/31/2019 3:39:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[spB3_GetB3SettingValue]
(
	@GameId int,
	@B3SettingId int,
	@SettingCategoryId int,
	@Value nvarchar(500),
	@B3Value nvarchar(500) output
)
as
--==========================
--20170502(knc): Add support for w2trigger settings
--20191022(knc): Added setting for geofencing
--==========================
begin

declare @Table nvarchar(100)
declare @Column nvarchar(100)

if (@SettingCategoryId = 1)
begin
	set @Table = 'b3.dbo.' + (select GameName from Daily.dbo.B3Game where GameID = @GameId) +'_GameSettings'
end
else
begin

	select @Table =  
			case  @SettingCategoryId 
				--when 1  then '' 
				when 2  then 'b3.dbo.B3_Operators' 
				when 3  then 'b3.dbo.B3_PlayerConfig' 
				when 4  then 'b3.dbo.B3_SalesConfig' 
				when 5  then 'b3.dbo.Server_GameSettings' 
				when 6  then 'b3.dbo.B3_Session'
				when 7  then 'b3.dbo.B3_SystemConfig'
				when 9  then 'b3.dbo.B3_SystemConfig'
				end
end
	
select @Column = (select SettingDesc from B3SettingsGlobal where SettingID = @B3SettingId)
if (@SettingCategoryId = 1 and (@B3SettingId in (1,2,3,4,5,6,7,8)))
begin
	select @Column =  replace(@Column,' ','_')
end
else
begin
	select @Column =  replace(@Column,' ','')
end


--Override existing value if one of the statement is true
select @Column =  case 
						when (@SettingCategoryId = 1 and @B3SettingId = 11)  
								then  case 
											when @GameId IN (1, 3) then 'callspeed_max'	
											else 'callspeed'	 end
						when (@SettingCategoryId = 1 and (@GameId = 1 OR @GameId = 3) and @B3SettingId = 59) then 'callspeed_min'
						when @B3SettingId  = 60 then 'callspeed_bonus' 
						when @B3SettingId  = 14 then 'hidecardserialnum' 
					    when @B3SettingId  = 15 then 'singleoffer_bonus' 			
						when @B3SettingId  = 23 Or @B3SettingId  = 33 or @B3SettingId = 57 then 'mainvol' 
						when @B3SettingId  = 26 then 'autoprintsessreport' 
						when @B3SettingId  = 30 then 'allowinSessBallChange'
						when @B3SettingId = 31 then 'loggingenabled'
						when @B3SettingId = 36 then 'consolationprizeamount'
						when @B3SettingId = 38 then 'waitcountdowntimerforotherplayers'
						when @B3SettingId = 43 then 'minplayers'
						when @B3SettingId = 45 then 'magcardsentinel_start'
						when @B3SettingId = 46 then 'magcardsentinel_end'
						when @B3SettingId = 48 then 'CommonRNGBallCallTime'
					    when @B3SettingId = 50 then 'UK'
					    when @B3SettingId = 51 then 'doubleaccount'
					    when @B3SettingId = 54 then 'IsNorthDakota'
					    when @B3SettingId = 55 then 'autosessend'
						when @B3SettingId = 61 then 'w2trigger'
						when @B3SettingId = 62 then 'handpaybypattern'
						when @B3SettingId = 63 then 'rfrequiredforplay'
						when @B3SettingId = 65 then 'GeofenceLongitude'
						when @B3SettingId = 66 then 'GeofenceLatitude'
						when @B3SettingId = 67 then 'GeofenceYellowBorder'
						when @B3SettingId = 68 then 'GeofenceRedBorder'
						when @B3SettingId = 69 then 'MinGameThreads'
			      else @Column end



declare @SQLCommand  nvarchar(1000)
declare @ParamDef nvarchar(500)

set @SQLCommand = 'select @B3ValueOUT = ' + @Column + ' from ' + @Table
set @ParamDef = N'@B3ValueOUT nvarchar(500) OUTPUT'
execute sp_executesql @SQLCommand, @ParamDef, @B3ValueOUT = @B3Value OUTPUT

--Do we need to update the daily.dbo.B3SettingsGlobal  If they dont match?
--There is no need to update the daily.dbo.B3SettingsGlobal it will update when the user hit the save button.

--if (@B3Value != @Value)
--	begin
--		if (@GameId != 0)
--		begin
--			update B3SettingsGlobal 
--			set SettingValue = @B3Value
--			where SettingID = @B3SettingId 
--		end
--		else
--		begin
--			update B3SettingGame 
--			set Value = @B3Value
--			where SettingID = @B3SettingId
--			and B3GameID = @GameId
--		end
--	end
return

end

--===============
--FOR TESTING
--===============
/*
declare
	@GameId int,
	@B3SettingId int,
	@SettingCategoryId int,
	@Value nvarchar(500),
	@B3Value nvarchar(500) 
	--output
	set @GameId = 0
	set @B3SettingId = 66
	set @SettingCategoryId = 8
	set @Value = '9.8766554'
	*/















GO


