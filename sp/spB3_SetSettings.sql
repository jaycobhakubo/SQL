USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spB3_SetSettings]    Script Date: 4/30/2017 7:39:35 PM ******/
DROP PROCEDURE [dbo].[spB3_SetSettings]
GO

/****** Object:  StoredProcedure [dbo].[spB3_SetSettings]    Script Date: 4/30/2017 7:39:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[spB3_SetSettings]
-- ============================================================================
-- 2016.03.31 US4570 Adding support for storing the b3 setting
-- 2016.06.30 DE13052 Error found in US4578: (US4565) B3: View or edit spirit 76 Bingo settings > Call Speed Bonus
-- 20160711(knc) Add audit log business logic.
-- ============================================================================
     @b3SettingId int
    ,@b3GameId int
    ,@value nvarchar(500)
    ,@machineId int = null
as
SET NOCOUNT ON

	if (@b3GameId = 4 and @b3SettingId = 59)--SettingID 60 = CallSpeed Bonus for spirit 76
	begin
		set @b3SettingId = 60
	end
	
	  exec spB3_AuditLog  @b3SettingId ,@b3GameId ,@value ,@machineId 

    if (nullif(@b3GameId, 0) is null)
    begin
        -- A game id wasn't specified so this is a system setting
        update B3SettingsGlobal
        set SettingValue = @value
        where SettingId = @b3SettingId
    end
    else
    begin
        -- Update the existing setting
        update B3SettingGame
        set Value = @value
        where SettingId = @b3SettingId
            and B3GameId = @b3GameId
            
        if (@@ROWCOUNT = 0)
        begin
            -- The setting did not exist in the table so add a new one
            insert into B3SettingGame
                (SettingId, B3GameId, Value)
            values
                (@b3SettingId, @b3GameId, @value)
        end
    end
    
    exec spB3_UpdateB3DBSettings @b3GameId, @b3SettingId, @value

SET NOCOUNT OFF









GO


