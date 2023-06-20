
DECLARE @object INT;
DECLARE @rest INT;
DECLARE @body NVARCHAR(MAX)
DECLARE @responseText NVARCHAR(MAX)
DECLARE @id  NVARCHAR(MAX) = '99'

SET @body = '{
    "userId": 77,
    "title": "Mohamed Anwar Alhamed",
    "body": "I am software developer"
  }'

DECLARE @url NVARCHAR(MAX);
--DECLARE @authHeader NVARCHAR(64);
DECLARE @contentType NVARCHAR(64);
--DECLARE @apiKey NVARCHAR(32);

DECLARE @json AS TABLE(Json_Table NVARCHAR(MAX))

--SET @authHeader = 'BASIC 0123456789ABCDEF0123456789ABCDEF';
SET @contentType = 'application/json';

--SET @apiKey = (SELECT api_key FROM [SigmaCodingDatabase].[dbo].[API_Services] WHERE service_name = 'Alpha Vantage')

SET @url = 'https://jsonplaceholder.typicode.com/posts/'+@id

EXEC sp_OACreate 'MSXML2.XMLHTTP', @object OUT;
--IF @rest <> 0 RAISERROR('Unable to open HTTP connection.', 10, 1);

EXEC sp_OAMethod @object, 'open', NULL, 'PUT', @url, 'false';
--EXEC @rest = sp_OAMethod @object, 'setRequestHeader', NULL, 'Authentication', @authHeader;
EXEC sp_OAMethod @object, 'setRequestHeader', NULL, 'Content-type', @contentType;
EXEC sp_OAMethod @object, 'send', null ,@body

EXEC sp_OAGetProperty @object, 'responseText', @responseText OutPut
INSERT into @json (Json_Table) EXEC sp_OAGetProperty @object, 'responseText'

SELECT * FROM @json

SELECT [posts].[userId] as UserId,
[posts].[id] as ID,
[posts].[title] as Title,
[posts].[body] as Body
FROM OPENJSON((SELECT * FROM @json))  
WITH (
	[userId] NVARCHAR(MAX),
	[id] NVARCHAR(MAX),
	[title] NVARCHAR(MAX),
	[body] NVARCHAR(MAX)
) as posts

