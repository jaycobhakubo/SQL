Use Daily 
go
if exists(select 1 from Reports)
begin
delete from Reports where ReportID = -274
delete from Reports where ReportFileName = 'B3_BingoCardReport.rpt'
end
go
SET IDENTITY_INSERT Reports ON
insert into Reports (ReportID, ReportTypeID, IsActive, ReportFileName)
values (-274, 18, 1, 'B3_BingoCardReport.rpt')
SET IDENTITY_INSERT Reports OFF
