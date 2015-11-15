
SELECT
		d.name 
	FROM
		sys.databases d
	WHERE
		d.name not in ('master', 'model', 'msdb', 'tempdb', 'SSISDB')
	ORDER BY
		d.name;
