#!/bin/bash

report_file="/tmp/system_report.txt"

echo "System Report Bisola Adesola - $(date)" > "$report_file"
echo "" >> "$report_file"

echo "Disk Usage:" >> "$report_file"
df -h >> "$report_file"
echo "" >> "$report_file"

echo "CPU Load:" >> "$report_file"
top -bn1 | grep "Cpu(s)" >> "$report_file"
echo "" >> "$report_file"

echo "Memory Usage:" >> "$report_file"
free -h >> "$report_file"

curl -X POST -H 'Content-type: application/json' \
--data "{\"text\": $(jq -Rs . < $report_file)}" \




