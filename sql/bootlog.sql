.mode column
.width 20 30 30 9 10 3
SELECT
	datetime(oob_time_sec, 'unixepoch'),
	ip_saddr_str,ip_daddr_str,
	CASE ip_protocol
		WHEN 0
			THEN 'v6-HopOpt'
		WHEN 1
			THEN 'ICMP'
		WHEN 2
			THEN 'IGMP'
		WHEN 4
			THEN 'IP-IP'
		WHEN 6
			THEN 'TCP'
		WHEN 17
			THEN 'UDP'
		WHEN 41
			THEN 'IPv6-IP'
		WHEN 43
			THEN 'v6-Route'
		WHEN 44
			THEN 'v6-Frag'
		WHEN 47
			THEN 'GRE'
		WHEN 50
			THEN 'ESP'
		WHEN 51
			THEN 'AH'
		WHEN 58
			THEN 'ICMPv6'
		WHEN 59
			THEN 'v6-NoNxt'
		WHEN 60
			THEN 'v6-Opts'
		WHEN 111
			THEN 'IPX-IP'
		WHEN 115
			THEN 'L2TPv3'
		WHEN 136
			THEN 'UDPLite'
		ELSE '('||ip_protocol||')'
	END ip_proto,
	CASE ip_protocol
		WHEN 1
			THEN
				CASE icmp_type
					WHEN 0
						THEN 'echo reply'
					WHEN 3
						THEN 'dest. unreach'
					WHEN 8
						THEN 'echo'
					WHEN 11
						THEN 'time exceeded'
					ELSE '('||icmp_type||')'
				END
	END options,
	icmp_echoseq
FROM bootlog
ORDER BY oob_time_sec desc, oob_time_usec desc
LIMIT 37;
