#! /bin/bash
if groups $€ | grep -q '\bsudo\b' ; then
	log_dir="$1"
	output="../data/logs/rapport_logs.txt"
	>"$output"
	for logfile in "$log_dir"/*.log do
		echo "fichier : $(basename "logfile")" >> "$output"
		echo "error : $(grep -c 'error' "$logfile")" >> "$output"
		echo "wornning : $(grep -c 'wornning' "logfile")" >> "$output"
		echo "info : $(grep -c 'info' "logfile")" >> "$output"
		echo "---" >> "$output"
	done
else
	echo "etre dans le grp sudo "
	exit 1
fi

