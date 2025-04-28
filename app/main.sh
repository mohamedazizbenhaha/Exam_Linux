#!/bin/bash
# filepath: /home/workspace/ExamLinux/app/main.sh

# Description: This script performs basic system checks and outputs the results.

echo "=== System Information ==="
echo "Hostname: $(hostname)"
echo "Operating System: $(uname -o)"
echo "Kernel Version: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo ""

echo "=== Disk Usage ==="
df -h | grep '^/dev/'
echo ""

echo "=== Memory Usage ==="
free -h
echo ""

echo "=== Active Users ==="
who
echo ""

echo "=== Network Configuration ==="
ip addr show | grep 'inet ' | awk '{print $2}'
echo ""
