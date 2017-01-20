exec spRpt_B3_DrawerReport 2, 15,15,'1/13/2017 00:00:00'

SELECT *
	FROM b3.dbo.B3_CashDrawerJournal

alter PROCEDURE [dbo].[spRpt_B3_DrawerReport]
 
@UserId int, --UI
@Station varchar(100), --UI
@MachineID int,
@nDate datetime

--set @nDate = '07/08/2016 00:00:00'
--set @MachineID = 7
AS
SET NOCOUNT ON

	DECLARE @cSessActive char(1)
	DECLARE @nSessNum int

	SELECT TOP 1 @nSessNum = sessnum, @cSessActive = sessactive
	FROM b3.dbo.B3_Session

	declare @cClientMac char(12)
	set @cClientMac =  (select top 1 ClientIdentifier from Daily.dbo.Machine where MachineID = @MachineID )

	SELECT LoginID, UserName, ClientMac, ClientName, 
	ISNULL(SUM(CASE WHEN CreditAmt > 0 AND TransType = 1 THEN 1 END), 0) AS 'QuantitySoldTotal', ISNULL(SUM(CASE WHEN TransType = 1 THEN CreditAmt ELSE 0 END), 0) AS 'CreditAmtSoldTotal',
	ISNULL(SUM(CASE WHEN ((CreditAmt + WinCreditAmt) > 0) AND TransType = 2 THEN 1 END), 0) AS 'QuantityRedeemTotal', ISNULL(SUM(CASE WHEN TransType = 2 THEN (CreditAmt + WinCreditAmt) ELSE 0 END), 0) AS 'CreditAmtRedeemTotal'
	FROM b3.dbo.B3_CashDrawerJournal WITH (NOLOCK)
	WHERE 
	sessnum = @nSessNum and
	ClientMac = /*@cClientMac*/'0800273042D9' 
	--and CONVERT(VARCHAR(10), TransDate, 101) = CONVERT(VARCHAR(10), @nDate, 101) 
	GROUP BY LoginID, ClientMac, UserName, ClientName ORDER BY UserName ASC



GO

SELECT *
	FROM b3.dbo.B3_CashDrawerJournal


--select * from Daily.dbo.Machine

