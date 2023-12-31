RESTORE DATABASE [AdventureWorks] FROM DISK = '/tmp/AdventureWorks2022.bak' 
WITH FILE = 1,
MOVE 'AdventureWorks2022' TO '/var/opt/mssql/data/AdventureWorks2022.mdf',
MOVE 'AdventureWorks2022_Log' TO '/var/opt/mssql/data/AdventureWorks2022_log.ldf',
NOUNLOAD, REPLACE, STATS = 5
GO

