if [ $# -ne 1 ]; then
        echo "il n'appartient pas ou il ya un erreur"
        exit 1
fi
if [ ! ` groups | grep -q "\broot\b" ` ]; then
        echo "il n'appartient pas"
        exit 1
fi
for i in `/home/workspace/ExamLinux/data/logs`; do
        grep -c "ERROR"<i >>$1
        grep -c "WARNING"<i >>$1
        grep -c "INFO"<i >>$1
done 

