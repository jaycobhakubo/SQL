USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spB3_GetSettings]    Script Date: 4/30/2017 7:45:02 PM ******/
DROP PROCEDURE [dbo].[spB3_GetSettings]
GO

/****** Object:  StoredProcedure [dbo].[spB3_GetSettings]    Script Date: 4/30/2017 7:45:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[spB3_GetSettings]
-- ============================================================================
-- Author: Karlo Camacho
-- Date: 20151019 
-- Description: Get B3 settings.
--
--  US4313
--  2015.10.19 jkn: changed the variables from bits to ints
--  2015.11.11 jkn: US4299 Added support for retrieving the enforcemix and
--  allow in session ball change settings from the B3 database
--  2015.12.11 jkn: Added support for retrieving the double accounting setting
--  2015.03.28 US4570 Adding support for retrieving B3 settings. This has been
--      changed to retrieve settings from the B3SettingsGlobal and B3SettingGame
--      tables
-- 2016.08.17(knc) Check and update the result set if dont match the setting value from the B3 database.
-- ============================================================================
as
SET NOCOUNT ON

declare @B3Settings table (
    B3SettingId int
    , SettingCategoryId int
    , B3GameId int
    , Value nvarchar(500))
    
insert into @B3Settings
    select SettingId
        , SettingCategoryId
        , null
        , SettingValue
    from B3SettingsGlobal
    where SettingValue is not null
        
insert into @B3Settings
    select gm.SettingId
        , g.SettingCategoryId
        , gm.B3GameId
        , gm.Value
    from B3SettingGame gm
        join B3SettingsGlobal g on gm.SettingId = g.SettingId


declare @B3SettingId int
declare @B3SettingCategoryId int
declare @B3GameId int
declare @Value nvarchar(500)
declare @B3Value nvarchar(500)

declare db_cursor cursor local fast_forward for 
select B3SettingId
        , SettingCategoryId
        , isnull(B3GameId, 0) as B3GameId
        , Value
from @B3Settings
order by B3SettingId, B3GameId

open db_cursor 
fetch next from db_cursor into @B3SettingId, @B3SettingCategoryId, @B3GameId, @Value

while @@FETCH_STATUS = 0
begin
	if (@B3SettingId != 58 )
	begin

		exec spB3_GetB3SettingValue @B3GameId, 	@B3SettingId, @B3SettingCategoryId, @Value, @B3Value OUTPUT		
		--select  	@B3SettingId, @B3SettingCategoryId, @B3GameId, @Value
		if (@B3Value != @Value)
		begin
			update @B3Settings
			set Value = @B3Value
			where B3SettingId = @B3SettingId 
			and isnull(B3GameId,0) = @B3GameId
		end
	end
	
	fetch next from db_cursor into @B3SettingId, @B3SettingCategoryId, @B3GameId, @Value
end

close db_cursor
deallocate db_cursor

select B3SettingId
        , SettingCategoryId
        , isnull(B3GameId, 0) as B3GameId
        , Value
from @B3Settings order by B3SettingId asc

SET NOCOUNT OFF






GO


