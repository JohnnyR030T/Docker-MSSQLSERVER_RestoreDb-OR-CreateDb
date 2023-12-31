# Docker-MSSQLSERVER_RestoreDb-OR-CreateDb
Restore .BAK file and/or create a new database in a Docker container.

- Open a PowerShell terminal

- navigate to the location of the Docker_MSSQLServer_Restore folder

- Run the commands below to build the custom image and then create a container with the restored database:
```copy
docker build -t sqlserver-development .
```

```copy
docker run -p 11433:1433 -d sqlserver-development
```

- You should then be able to open SSMS and connect to the database like so:

![image](https://github.com/JohnnyR030T/Docker-MSSQLSERVER_RestoreDb-OR-CreateDb/assets/2913985/31d1564e-11db-4981-a40b-bfc7e59d1ee2)


  - Server type: Database Engine
	- Server name: localhost,11433
	- Authentication: SQL Server Authentication
	- Login: sa
	- Password: Pwd12345!  (Or whatever you set the password to be in the DOCKERFILE)
