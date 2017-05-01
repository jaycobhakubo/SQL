USE [Daily]
GO

/****** Object:  StoredProcedure [dbo].[spB3GetGameSettings]    Script Date: 4/30/2017 6:46:57 PM ******/
DROP PROCEDURE [dbo].[spB3GetGameSettings]
GO

/****** Object:  StoredProcedure [dbo].[spB3GetGameSettings]    Script Date: 4/30/2017 6:46:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Brandon D. Hendrix
-- Create date: 2011/02/18
-- Description:	Returns the B3 Games settings
-- =============================================
CREATE PROCEDURE [dbo].[spB3GetGameSettings]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT GameSettingID, GameSettingValue FROM B3GameSettingsGlobal s;
	
	SET NOCOUNT OFF
END




























GO


