#! /bin/bash
#! /bin/sh

home_dir=/home/ec2-user/Monitoring
OUTPUT_FILE="/home/ec2-user/Monitoring/sPACE.html"

disk1_space()
{

	echo "<pre>"
	df / |grep -vE '^Filesystem|172.31.28.147' | awk '{ print $4}'
	echo "</pre>"
	
}

cat <<- _EOF_ > $OUTPUT_FILE
	<!DOCTYPE html>
	<html>
	<head>
		<title>$TITLE</title>
			<h2 font-family: Arial align="center"> Time sheet </h2>
			<style>
			table, th, td {
			border: 1px solid black;
			}
			th {
			background-color: #FCF3CF
			}
			td {
			background-color: #2980B9
			}
			</style>
	</head>

	<body>
	<table style="width:100%">
	<tr>
	<th><b>Health Check Parameters<b></th>
	<th><b>Environment Details</b></th>
	<th><b>Status</b></th>		
	</tr>
	<tr>
      <td>Hostname</td>
      <td>df /</td>
      <td>$(disk1_space)</td>
    </tr>
</table>

</body>
</html>