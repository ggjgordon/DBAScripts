SELECT	[backup_set_id],
		[media_set_id],
		[name],
		[backup_start_date],
		[backup_finish_date],
		CASE [type] 
			WHEN 'D' THEN 'Full'
			WHEN 'I' THEN 'Differential'
			WHEN 'L' THEN 'Transaction Log'
			ELSE NULL
		END [backup_type],
		[backup_size],
		[database_name],
		[server_name],
		[compressed_backup_size]
FROM [msdb].[dbo].[backupset] 
WHERE [database_name] = 'DWH'
ORDER BY [backup_set_id] DESC