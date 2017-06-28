use Daily
go
if not exists (select 1 from GlobalSettings where GlobalSettingID = 359)
begin
	insert into GlobalSettings (GlobalSettingID, SettingCategoryID, SettingName, SettingValue,  Comment)
	values
	(
	359,
	2,
	'Automatically apply coupons to sales on simple kiosks',
	'False',
	'True=As items are rung-up, any available coupons are applied starting with the ones closest to expiring.  False=Coupons are not applied automatically.'
	)
end
go

if not exists (select 1 from GlobalSettings where GlobalSettingID = 360)
begin
	insert into GlobalSettings (GlobalSettingID, SettingCategoryID, SettingName, SettingValue,  Comment)
	values
	(
	360,
	2,
	'Allow barcoded paper to be sold at a simple kiosk',
	'False',
	'True=Barcoded paper may be scanned at a simple kiosk.  False=Barcoded paper packages may not be purchased at a simple kiosk.'
	)
end
go

if not exists (select 1 from GlobalSettings where GlobalSettingID = 361)
begin
	insert into GlobalSettings (GlobalSettingID, SettingCategoryID, SettingName, SettingValue,  Comment)
	values
	(
	361,
	2,
	'Include the COUPONS button on the Hybrid kiosk',
	'False',
	'True=A button will be on the Hybrid kiosk screen allowing the player to select coupons.  False=The player will have no control over his coupons.'
	)
end
go

if not exists (select 1 from GlobalSettings where GlobalSettingID = 362)
begin
	insert into GlobalSettings (GlobalSettingID, SettingCategoryID, SettingName, SettingValue,  Comment)
	values
	(
	362,
	2,
	'Allow use of a simple kiosk without a player card',
	'False',
	'True=The initial swipe card screen will include a button for players without a card.  False=Kiosk users must have a player card.'
	)
end
go

if not exists (select 1 from GlobalSettings where GlobalSettingID = 363)
begin
	insert into GlobalSettings (GlobalSettingID, SettingCategoryID, SettingName, SettingValue,  Comment)
	values
	(
	363,
	2,
	'Kiosk Bill Acceptor Com Port',
	'5',
	'None or 0=No acceptor, 1 and up=Com port number.'
	)
end
go

if not exists (select 1 from GlobalSettings where GlobalSettingID = 364)
begin
	insert into GlobalSettings (GlobalSettingID, SettingCategoryID, SettingName, SettingValue,  Comment)
	values
	(
	364,
	2,
	'Kiosk Ticket Printer Name',
	'',
	'Name of the ticket printer (leave empty if no printer).'
	)
end
go
