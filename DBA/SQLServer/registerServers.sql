SELECT *
FROM [msdb].[dbo].[sysmanagement_shared_server_groups]
WHERE [server_group_id] in (48,50,183)
AND parent_id = 45
ORDER BY 2

SELECT *
FROM [msdb].[dbo].[sysmanagement_shared_registered_servers]
WHERE [server_group_id] in (10,48,50,183)
ORDER BY 3