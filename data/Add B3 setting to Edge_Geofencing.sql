--Saved this.
use Daily
declare @Longitude varchar(24)
declare @Latitude varchar(24)
declare @YellowZone int
declare @RedZone int
declare @B3SettingCategoryId int set @B3SettingCategoryId = 8

select @Longitude = GeofenceLongitude from b3.dbo.B3_SystemConfig
select @Latitude = GeofenceLatitude from b3.dbo.B3_SystemConfig
select @YellowZone = GeofenceYellowBorder from b3.dbo.B3_SystemConfig
select @RedZone =  GeofenceRedBorder from b3.dbo.B3_SystemConfig

--Longitude
if  exists(select 1 from [Daily].[dbo].[B3SettingsGlobal] where SettingID = 65)
begin
update [Daily].[dbo].[B3SettingsGlobal]
	set 
	SettingValue = @Longitude
	,SettingDesc = 'Longitude'
	,SettingCategoryID = @B3SettingCategoryId
	where SettingID = 65
end
else begin
	insert into [Daily].[dbo].[B3SettingsGlobal](SettingID, SettingCategoryID, SettingValue, SettingDesc)
	values (65, @B3SettingCategoryId, cast(@Longitude as varchar(100)),'Longitude' )
end

--Latitude
if  exists(select 1 from [Daily].[dbo].[B3SettingsGlobal] where SettingID = 66)
begin
update [Daily].[dbo].[B3SettingsGlobal]
	set 
	SettingValue = @Latitude
	,SettingDesc = 'Latitude'
	,SettingCategoryID = @B3SettingCategoryId
	where SettingID = 66
end
else begin
	insert into [Daily].[dbo].[B3SettingsGlobal](SettingID, SettingCategoryID, SettingValue, SettingDesc)
	values (66, @B3SettingCategoryId, cast(@Latitude as varchar(100)),'Latitude' )
end

--Yellow zone
if  exists(select 1 from [Daily].[dbo].[B3SettingsGlobal] where SettingID = 67)
begin
update [Daily].[dbo].[B3SettingsGlobal]
	set 
	SettingValue = @YellowZone
	,SettingDesc = 'Yellow Zone'
	,SettingCategoryID = @B3SettingCategoryId
	where SettingID = 67
end
else begin
	insert into [Daily].[dbo].[B3SettingsGlobal](SettingID, SettingCategoryID, SettingValue, SettingDesc)
	values (67, @B3SettingCategoryId, cast(@YellowZone as varchar(100)),'Yellow Zone' )
end

--Red zone
if  exists(select 1 from [Daily].[dbo].[B3SettingsGlobal] where SettingID = 68)
begin
update [Daily].[dbo].[B3SettingsGlobal]
	set 
	SettingValue = @RedZone
	,SettingDesc = 'Red Zone'
	,SettingCategoryID = @B3SettingCategoryId
	where SettingID = 68
end
else begin
	insert into [Daily].[dbo].[B3SettingsGlobal](SettingID, SettingCategoryID, SettingValue, SettingDesc)
	values (68, @B3SettingCategoryId, cast(@RedZone as varchar(100)),'Red Zone' )
end


select * from [Daily].[dbo].[B3SettingsGlobal] where SettingID in  (65, 66,67,68)


