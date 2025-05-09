can_use_sudo=$(groups | grep -c sudo) 
if [ "$can_use_sudo" -eq 0]; then
        echo "you need to be in the sudo group to run this script"
        exit  1
fi      
if [ -z "$1"]; then
        echo "please provide the logs directory path"
        exit  1
fi

log_directory=$1
report="rapport_logs.txt"

for logfile in $log_directory/*.log ; do
        if [ -f "$logfile" ] ; then
                echo "analysing $logfile" > $report
                errors= $(grep -c "ERROR" "$logfile")
                warnings= $(grep -c "WARNING" "$logfile")
                infos= $(grep -c "INFO" "$logfile")

                echo "errors found $errors" >> $report
                echo "warnings  found $warnings" >> $report
                echo "infos found $infos" >> $report
        fi
done



~                                                                                                                                                                                                                  
~                                                                                                                                                                                                                  
~                                                                                                                                                                                                                  
~                                                                                                                                                                                                                  
~                                                                                                                                                                                                                  
~        
