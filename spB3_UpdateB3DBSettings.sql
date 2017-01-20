USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spB3_UpdateB3DBSettings]    Script Date: 01/20/2017 11:25:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spB3_UpdateB3DBSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spB3_UpdateB3DBSettings]
GO

USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spB3_UpdateB3DBSettings]    Script Date: 01/20/2017 11:25:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









create proc [dbo].[spB3_UpdateB3DBSettings]
(
@GameId int,
@SettingId int,
@Value nvarchar(500)
)
as
--==========================
--DE13029
--==========================
declare @GameName varchar(50) set @GameName = ''
declare @TableName varchar(100) set @TableName = ''
DECLARE @sqlCommand nvarchar(1000)
declare @count int 


if (@GameId != 0)
begin
	select @GameName =  case 
	when @GameId = 1 then 'CrazyBout' 
	when @GameId = 2 then 'JailBreak' 
	when @GameId = 3 then 'MayaMoney' 
	when @GameId = 4 then 'Spirit76' 
	when @GameId = 5 then 'TimeBomb' 
	when @GameId = 6 then 'UkickEm' 
	when @GameId = 7 then 'WildBall' 
	when @GameId = 8 then 'WildFire' end

	set @TableName = 'b3.dbo.'+ @GameName +'_GameSettings'
end

--GAME SETTING
if (@SettingId = 1)
begin 
  if (@GameId != 8)
  begin
	SET @sqlCommand = 'Update '+@TableName +' set denom_1 =  cast('''+ @value +''' as char )' 
  end
end
else if (@SettingId = 2)
begin 
  if (@GameId != 8)
  begin
	SET @sqlCommand = 'Update '+@TableName +' set denom_5 =  cast('''+ @value +''' as char )' 
  end
end
else if (@SettingId = 3)
begin 
  if (@GameId != 8)
  begin
	SET @sqlCommand = 'Update '+@TableName +' set denom_10 =  cast('''+ @value +''' as char )' 
  end
end
else if (@SettingId = 4)
begin 
  if (@GameId != 8)
  begin
	SET @sqlCommand = 'Update '+@TableName +' set denom_25 =  cast('''+ @value +''' as char )' 
  end
end
else if (@SettingId = 5)
begin 
  if (@GameId != 8)
  begin
	SET @sqlCommand = 'Update '+@TableName +' set denom_50 =  cast('''+ @value +''' as char )' 
  end
end
else if (@SettingId = 6)
begin 
  if (@GameId != 8)
  begin
	SET @sqlCommand = 'Update '+@TableName +' set denom_100 =  cast('''+ @value +''' as char )' 
  end
end
else if (@SettingId = 7)
begin 
  if (@GameId != 8)
  begin
	SET @sqlCommand = 'Update '+@TableName +' set denom_200 =  cast('''+ @value +''' as char )' 
  end
end
else if (@SettingId = 8)
begin 
  if (@GameId != 8)
  begin
	SET @sqlCommand = 'Update '+@TableName +' set denom_500 =  cast('''+ @value +''' as char )' 
  end
end
else if (@SettingId = 9)
begin 

	SET @sqlCommand = 'Update '+@TableName +' set maxbetlevel =  cast('''+ @value +''' as int )' 

end
else if (@SettingId = 10)
begin 
   if (@GameId != 6)
   begin
	SET @sqlCommand = 'Update '+@TableName +' set maxcards =  cast('''+ @value +''' as int )' 
	end
end
else if (@SettingId = 11)--CallSpeed_max and regular speed
begin 
     if (@GameId = 1 or @GameId = 3)--Crazybout and maya money has min and max speed 
     begin 
        SET @sqlCommand = 'Update '+@TableName +' set callspeed_max =  cast('''+ @value +''' as int )' 
     end
     else
     begin 
        SET @sqlCommand = 'Update '+@TableName +' set callspeed =  cast('''+ @value +''' as int )' 
     end
end
else if (@SettingId = 59)--CallSpeed_min
begin 
     if (@GameId = 1 or @GameId = 3)--Crazybout and maya money has min and max speed 
     begin 
        SET @sqlCommand = 'Update '+@TableName +' set callspeed_min =  cast('''+ @value +''' as int )' 
     end
  
end
else if (@SettingId = 60)--CallSpeed_min
begin 
        SET @sqlCommand = 'Update '+@TableName +' set callspeed_bonus =  cast('''+ @value +''' as int )' 
end
else if (@SettingId = 12)
begin 

	SET @sqlCommand = 'Update '+@TableName +' set autocall =  cast('''+ @value +''' as char)' 

end
else if (@SettingId = 13)
begin 

	SET @sqlCommand = 'Update '+@TableName +' set autoplay =  cast('''+ @value +''' as char)' 

end
else if (@SettingId = 14)
begin 

	SET @sqlCommand = 'Update '+@TableName +' set hidecardserialnum =  cast('''+ @value +''' as char)' 

end
else if (@SettingId = 15)
begin 

		if (@GameId = 1 or @GameId = 7)
		begin
		SET @sqlCommand = 'Update '+@TableName +' set singleoffer_bonus =  cast('''+ @value +''' as char)' 
		end
end
else if (@SettingId = 58)
begin 
	  declare @PackageName varchar(1000)
	  select @PackageName = PackageName  from dbo.B3MathPackageDef where MathPackageID = cast (@Value as int)  
	  set @sqlCommand = 'exec b3.dbo.' + @PackageName
end

--PLAYER
else if (@SettingId = 16)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_playerConfig set calibratetouch =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 17)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_playerConfig set presstocollect =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 18)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_playerConfig set announcecall =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 19)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_playerConfig set screencursor =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 20)
begin 

--declare @MilliSec int 
--Set @MilliSec = (CAST(@Value as int) * 1000)
--Set @Value = CAST(@MilliSec as varchar(50))

	SET @sqlCommand = 'Update b3.dbo.B3_playerConfig set timetocollect =  cast('''+ @value +''' as int)' 
end
else if (@SettingId = 21)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_playerConfig set disclaimer =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 22)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_playerConfig set disclaimertextid =  cast('''+ @value +''' as int)' 
end
else if (@SettingId = 23)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_playerConfig set mainvol =  cast('''+ @value +''' as int)' 
end


--SALES
else if (@SettingId = 24)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SalesConfig set screencursor =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 25)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SalesConfig set calibratetouch =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 26)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SalesConfig set autoprintsessreport =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 27)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SalesConfig set pageprinter =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 28)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SalesConfig set quicksales =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 29)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SalesConfig set printlogo =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 30)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SalesConfig set allowinsessballchange =  cast('''+ @value +''' as char)' 
end

else if (@SettingId = 31)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SalesConfig set loggingenabled =  cast('''+ @value +''' as char)' 
end

else if (@SettingId = 32)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SalesConfig set logrecycledays =  cast('''+ @value +''' as char)' 
end

else if (@SettingId = 33)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SalesConfig set mainvol =  cast('''+ @value +''' as int)' 
end

--SERVER GAME
else if (@SettingId = 34)
begin 
	SET @sqlCommand = 'Update b3.dbo.Server_GameSettings set minplayer =  cast('''+ @value +''' as int)' 
end
else if (@SettingId = 35)
begin 
	SET @sqlCommand = 'Update b3.dbo.Server_GameSettings set gamestartdelay =  cast('''+ @value +''' as int)' 
end
else if (@SettingId = 36)
begin 

--if (CHARINDEX('.', @Value) != 0)
--	begin
	
--		set @count = (select len(SUBSTRING(@Value, CHARINDEX('.', @Value), LEN(@Value))) - 1)
 
--               while (@count != 2)
--				begin
--				   set @Value = @Value + '0';
--				   set @count = @count + 1
--				end	
--	end
--	else
--	begin

--	   set @Value = @Value + '.00'
--	end
	
--	set @Value = REPLACE(@Value, '.', '')
			
	SET @sqlCommand = 'Update b3.dbo.Server_GameSettings set consolationprizeamount =  cast('''+ @value +''' as bigint)' 
end
else if (@SettingId = 37)
begin 
	SET @sqlCommand = 'Update b3.dbo.Server_GameSettings set gamerecallpassword =  cast('''+ @value +''' as varchar(100))' 
end
else if (@SettingId = 38)
begin 
	SET @sqlCommand = 'Update b3.dbo.Server_GameSettings set waitcountdowntimerforotherplayers =  cast('''+ @value +''' as int)' 
end

--SESSION
else if (@SettingId = 39)
begin 

--if (CHARINDEX('.', @Value) != 0)
--	begin

--		set @count = (select len(SUBSTRING(@Value, CHARINDEX('.', @Value), LEN(@Value))) - 1)
 
--               while (@count != 2)
--				begin
--				   set @Value = @Value + '0';
--				   set @count = @count + 1
--				end	
--	end
--	else
--	begin

--	   set @Value = @Value + '.00'
--	end
	
	--set @Value = REPLACE(@Value, '.', '')
	SET @sqlCommand = 'Update b3.dbo.B3_Session set payoutlimit =  cast('''+ @value +''' as bigint)' 
end
else if (@SettingId = 40)
begin 

--if (CHARINDEX('.', @Value) != 0)
--	begin

--		set @count = (select len(SUBSTRING(@Value, CHARINDEX('.', @Value), LEN(@Value))) - 1)
 
--               while (@count != 2)
--				begin
--				   set @Value = @Value + '0';
--				   set @count = @count + 1
--				end	
--	end
--	else
--	begin

--	   set @Value = @Value + '.00'
--	end
	
	--set @Value = REPLACE(@Value, '.', '')
	SET @sqlCommand = 'Update b3.dbo.B3_Session set jackpotlimit =  cast('''+ @value +''' as bigint)' 
end
else if (@SettingId = 41)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_Session set enforcemix =  cast('''+ @value +''' as char)' 
end

--SYSTEM SETTING
else if (@SettingId = 42)
begin 
--if (CHARINDEX('.', @Value) != 0)
--	begin

--		set @count = (select len(SUBSTRING(@Value, CHARINDEX('.', @Value), LEN(@Value))) - 1)
 
--               while (@count != 2)
--				begin
--				   set @Value = @Value + '0';
--				   set @count = @count + 1
--				end
--	end
--	else
--	begin

--	   set @Value = @Value + '.00'
--	end
	
--	set @Value = REPLACE(@Value, '.', '')
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set handpaytrigger =  cast('''+ @value +''' as bigint)' 
end
else if (@SettingId = 43)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set minplayers =  cast('''+ @value +''' as int)' 
end

else if (@SettingId = 44)
begin 
--if (CHARINDEX('.', @Value) != 0)
--	begin

--		set @count = (select len(SUBSTRING(@Value, CHARINDEX('.', @Value), LEN(@Value))) - 1)
 
--               while (@count != 2)
--				begin
--				   set @Value = @Value + '0';
--				   set @count = @count + 1
--				end
	

--	end
--	else
--	begin

--	   set @Value = @Value + '.00'
--	end
	
--	set @Value = REPLACE(@Value, '.', '')
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set vippointmultiplier =  cast('''+ @value +''' as bigint)' 
end
else if (@SettingId = 45)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set  magcardsentinel_start =  cast('''+ @value +''' as char)' 
end

else if (@SettingId = 46)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set magcardsentinel_end =  cast('''+ @value +''' as char)' 
end

else if (@SettingId = 47)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set currency =  cast('''+ @value +''' as varchar(50))' 
end

else if (@SettingId = 48)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set commonrngballcalltime =  cast('''+ @value +''' as int)' 
end

else if (@SettingId = 49)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set playerpinlength =  cast('''+ @value +''' as int)' 
end

else if (@SettingId = 50)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set uk =  cast('''+ @value +''' as char)' 
end

else if (@SettingId = 51)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set doubleaccount =  cast('''+ @value +''' as char)' 
end

else if (@SettingId = 52)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set multioperator =  cast('''+ @value +''' as char)' 
end

else if (@SettingId = 53)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set commonrngballcall =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 54)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set isnorthdakota =  cast('''+ @value +''' as char)' 
end
else if (@SettingId = 55)
begin 
     if (@Value = 'OFF') begin set @Value = '' end
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set autosessend =  cast('''+ @value +''' as varchar(50))' 
end
else if (@SettingId = 56)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set sitename =  cast('''+ @value +''' as varchar(16))' 
end
else if (@SettingId = 57)
begin 
	SET @sqlCommand = 'Update b3.dbo.B3_SystemConfig set mainvol =  cast('''+ @value +''' as int)' 
end

--select @sqlCommand
exec (@sqlCommand)

--Sync value to Daily DB (daily.dbo.B3SettingGame)
--if (@SettingId = 58)
--	begin
--	IF OBJECT_ID('tempdb..#TempTable') IS not null drop table #TempTable 
--	Create table #TempTable  
--	(SettingID int, Denom int)

--	insert into #TempTable(SettingID, Denom) 
--	values 
--	(1, 1), 
--	(2,5), 
--	(3,10), 
--	(4,25), 
--	(5,50), 
--	(6,100),
--	(7,200), 
--	(8,500)

--    set @count = 1

--	while (@count != 9)--No cursor
--	begin
--	declare @denom int
--	select @denom = Denom from #TempTable where SettingID = @count

--	set @sqlCommand =   'update x
--						set x.Value = y.denom_' + CAST(@denom as varchar(10))  + ' 
--						from daily.dbo.B3SettingGame x 
--						join #TempTable z on z.SettingID = x.SettingID,
--						' + @TableName +' y
--						where x.B3GameID = '+ cast (@GameID as varchar(10))  +'
--						and x.SettingID = ' + cast(@count as varchar(10))
								
--			 exec (@sqlCommand)
--			 set @count = @count + 1
--	end
	 
--	IF OBJECT_ID('tempdb..#TempTable') IS not null drop table #TempTable 
--end



















GO


