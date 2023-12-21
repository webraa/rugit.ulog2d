.mode column
.width 20 30 30 9 10 3
SELECT
	datetime(oob_time_sec, 'unixepoch'),
	ip_saddr_str,ip_daddr_str,
	CASE ip_protocol
		WHEN 0
			THEN 'v6-HopOpt'
	END ip_proto,
	CASE ip_protocol
		WHEN 1
			THEN
				CASE icmp_type
					WHEN 0
						THEN 'echo reply'
				END
	END options,
	icmp_echoseq
FROM mainlog
ORDER BY oob_time_sec desc, oob_time_usec desc
LIMIT 37;
