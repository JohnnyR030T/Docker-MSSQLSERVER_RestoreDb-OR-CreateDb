# This Dockerfile sets up a SQL Server container using the latest version of SQL Server 2022.
# It copies the AdventureWorks2022.bak backup file and the restore-backup.sql script into the container.
# The script restores the backup file and sets the necessary environment variables.
# The resulting container can be used as a development environment for SQL Server.

# Make sure the docker Image here is the one you want to use.
FROM mcr.microsoft.com/mssql/server:2022-latest AS build
ENV ACCEPT_EULA=Y
# Change this password to a strong password
ENV MSSQL_SA_PASSWORD=Pwd12345! 
ENV MSSQL_PID=Developer
ENV MSSQL_TCP_PORT=1433

WORKDIR /tmp

# Change this to the name of your backup file
COPY AdventureWorks2022.bak .
COPY restore-backup.sql .
COPY create-database.sql .

RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 10 \
    # Restores the database from the backup file
    #&& /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Pwd12345!" -i /tmp/restore-backup.sql \
    # Creates A NEW Database
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Pwd12345!" -i /tmp/create-database.sql \
    && pkill sqlservr

FROM mcr.microsoft.com/mssql/server:2022-latest AS release

ENV ACCEPT_EULA=Y

COPY --from=build /var/opt/mssql/data /var/opt/mssql/data
