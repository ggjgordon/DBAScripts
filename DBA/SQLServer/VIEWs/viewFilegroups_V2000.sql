-- 
USE db_IDA2
SELECT 
	--fg.groupid,
    fg.groupname filegroup,
	f.fileid,
    f.name datafileName,	
	f.size pages,
	--f.filename,
	CONVERT (DEC(15,2),ROUND((f.size/128.000),2)) sizeMB,
	CONVERT (DEC(15,2),ROUND((f.size/128.000),2)/1024) sizeGB,	
	CONVERT (DEC(15,2),ROUND((FILEPROPERTY(f.name,'SpaceUsed')/128.000),2)) sizeUsedMB,
	CONVERT (DEC(15,2),ROUND((FILEPROPERTY(f.name,'SpaceUsed')/128.000),2)/1024) sizeUsedGB,
	CONVERT (DEC(15,2),ROUND(((f.size-FILEPROPERTY(f.name,'SpaceUsed'))/128.000),2)) sizeAvailableMB,
	CONVERT (DEC(15,2),ROUND(((f.size-FILEPROPERTY(f.name,'SpaceUsed'))/128.000),2)/2014) sizeAvailableGB,
    CONVERT (DEC(15,2),ROUND(FILEPROPERTY(f.name,'SpaceUsed')/128.000,2)/ROUND(f.size/128.000,2)*100) usagePercentage	
FROM sysfiles f (NOLOCK) JOIN sysfilegroups fg (NOLOCK) ON f.groupid = fg.groupid
WHERE f.filename like '%F:\%'
/*WHERE f.name LIKE '%Resumen%'
AND fg.groupname NOT IN (
'DWHClienteResumenMesActual',
'FGFACClientesResumen201606',
'FGFACClientesResumen201607',
'FGFACClientesResumen201608',
'DWHClienteResumenMesNuevo'
)*/
ORDER BY 10 DESC