
DECLARE @object INT;
DECLARE @rest INT;

DECLARE @url NVARCHAR(MAX);
--DECLARE @authHeader NVARCHAR(64);
DECLARE @contentType NVARCHAR(64);
--DECLARE @apiKey NVARCHAR(32);

DECLARE @json AS TABLE(Json_Table NVARCHAR(MAX))

--SET @authHeader = 'BASIC 0123456789ABCDEF0123456789ABCDEF';
SET @contentType = 'application/json';

--SET @apiKey = (SELECT api_key FROM [SigmaCodingDatabase].[dbo].[API_Services] WHERE service_name = 'Alpha Vantage')

SET @url = 'https://jsonplaceholder.typicode.com/users'

EXEC sp_OACreate 'MSXML2.XMLHTTP', @object OUT;
--IF @rest <> 0 RAISERROR('Unable to open HTTP connection.', 10, 1);

-- This calls the necessary methods.
EXEC sp_OAMethod @object, 'open', NULL, 'GET', @url, 'false';
--EXEC @rest = sp_OAMethod @object, 'setRequestHeader', NULL, 'Authentication', @authHeader;
EXEC sp_OAMethod @object, 'setRequestHeader', NULL, 'Content-type', @contentType;
EXEC sp_OAMethod @object, 'send'

INSERT into @json (Json_Table) EXEC sp_OAGetProperty @object, 'responseText'

SELECT * FROM @json


SELECT [addresses].[street] as Street,
		[addresses].[suite] as Suite,
		[users].[name] as names,
		[company].[name] as C_company,
		[company].[catchPhrase] as CatchPhrase

FROM OPENJSON((SELECT * FROM @json))  

WITH (
	[address] NVARCHAR(MAX) AS JSON,
	[company] NVARCHAR(MAX) AS JSON,
	[name] NVARCHAR(MAX) 
) as users


CROSS APPLY OPENJSON([users].[address])
WITH(
    [street] NVARCHAR(MAX),
    [suite] NVARCHAR(MAX)
) AS addresses


CROSS APPLY OPENJSON([users].[company])
WITH(
    [name] NVARCHAR(MAX),
    [catchPhrase] NVARCHAR(MAX)
) AS company
