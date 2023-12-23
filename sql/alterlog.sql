.mode column
.width 20 10 16 16 9 7 10
SELECT
	datetime(oob_time_sec, 'unixepoch') as timestamp,
	oob_prefix as info,
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
			THEN 'TCP:'||tcp_dport
		WHEN 17
			THEN 'udp:'||udp_dport
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
		WHEN 6
			THEN '<-'||tcp_sport
		WHEN 17
			THEN '<-'||udp_sport
		WHEN 1
			THEN
				CASE icmp_type
					WHEN 0
						THEN 'reply'
					WHEN 3
						THEN 'unrch'
					WHEN 8
						THEN 'echo'
					WHEN 11
						THEN 'tm.xcdd'
					ELSE '('||icmp_type||')'
				END
	END 'echo/SP',
	icmp_echoseq
FROM alterlog
ORDER BY oob_time_sec desc, oob_time_usec desc
LIMIT 37;
