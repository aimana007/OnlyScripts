#!/bin/bash
# If arguments provided, use them; otherwise read from stdin
if [ $# -gt 0 ]; then
    input="$*"
else
    input=$(cat)
fi
result=""
letter_count=0
for (( i=0; i<${#input}; i++ )); do
    char="${input:$i:1}"
    
    if [[ $char =~ [a-zA-Z] ]]; then
        if (( letter_count % 2 == 0 )); then
            result+="${char^^}"
        else
            result+="${char,,}"
        fi
        ((letter_count++))
    else
        result+="$char"
    fi
done
echo "$result"
