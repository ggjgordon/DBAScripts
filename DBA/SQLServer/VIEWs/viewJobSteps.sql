SELECT	[step_id],
		[step_name],
		[subsystem],
		[command],
		[database_name],
		CAST(STUFF(STUFF(CAST([last_run_date] AS VARCHAR),7,0,'-'),5,0,'-') + 
			' ' + 
			STUFF(STUFF(REPLACE(STR([last_run_time],6,0),' ','0'),5,0,':'),3,0,':') AS DATETIME) last_run
FROM [msdb].[dbo].[sysjobsteps]
WHERE [job_id]
IN (SELECT [job_id] 
	FROM [msdb].[dbo].[sysjobs]
	WHERE [enabled] = 1
	AND [name] like '%Audita Usuarios Admin%')
ORDER BY [step_id], 6 DESC