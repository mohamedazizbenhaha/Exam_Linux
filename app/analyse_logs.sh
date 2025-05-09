#!/bin/bash
if [ ! groups > grep sudo ]
then
	echo 'User doesnt belong to sudo group'
else
	echo 'User belongs to sudo group'
fi

list = `ls $1/*.log `

if [ ! -e /home/workspace/ExamLinux/data/logs/rapport_logs.txt ]
then 
	`touch /home/workspace/ExamLinux/data/logs/rapport_logs.txt`
else
	echo "File already exists"
fi


for f in list 
do	
	 echo "For file $f"
	`grep -c ERROR f`>> /home/workspace/ExamLinux/data/logs/rapport_logs.txt
	`grep -c WARNING f`>> /home/workspace/ExamLinux/data/logs/rapport_logs.txt
	`grep -c INFO f`>> /home/workspace/ExamLinux/data/logs/rapport_logs.txt
done

