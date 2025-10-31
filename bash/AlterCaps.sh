#!/bin/bash
# Read from stdin
while IFS= read -r line; do
    result=""
    letter_count=0
    
    for (( i=0; i<${#line}; i++ )); do
        char="${line:$i:1}"
        
        if [[ $char =~ [a-zA-Z] ]]; then
            if (( letter_count % 2 == 0 )); then
                result+="${char^^}"  # Uppercase
            else
                result+="${char,,}"  # Lowercase
            fi
            ((letter_count++))
        else
            # Keep non-letter characters as-is
            result+="$char"
        fi
    done
    
    echo "$result"
done
