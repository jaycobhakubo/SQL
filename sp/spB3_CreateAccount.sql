USE [Daily]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spB3_CreateAccount]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spB3_CreateAccount]
GO

USE [Daily]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[spB3_CreateAccount]
-- ============================================================================
-- Date: 20151130 
-- Description: Creates a B3 Account
--
--  US4381
--DE13139 - Add staff name to Session Transaction Report
-- ============================================================================
    @machineId int
    , @staffId int
    , @amount int
    , @accountNumber int output
    , @receiptNumber int output
as

    declare @clientMAC nvarchar(12)
    
    select @clientMAC = ClientIdentifier from Machine where MachineId = @machineId
    
declare @StaffUserName char(50)
set @StaffUserName = (select FirstName + ' ' + LastName from Daily.dbo.Staff where StaffID = @staffId)

    
    execute B3.dbo.usp_sales_b3_CreateCreditAcct
        @clientMac -- the MAC of the machine that made the sale
        , '' -- Client Name, the name of the machine
        , @StaffUserName -- Staff user name, using blank to use the staffid
        , @amount -- the amount to add to the account in pennies
        , 0 -- The vip number
        , @staffId -- the staffId that made the sale
        , 0 -- the pin number that will be used
        , @accountNumber output
        , @receiptNumber output







GO


