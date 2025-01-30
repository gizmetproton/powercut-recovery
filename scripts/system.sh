#!/bin/bash

# Source utility functions
source "$(dirname "$0")/utils.sh"

check_system() {
    print_status "Checking ship's vital signs..."
    
    # Check memory usage
    local mem_used=$(free | awk '/Mem:/ {printf("%.0f", ($3/$2) * 100)}')
    if [ "$mem_used" -gt 90 ]; then
        print_error "Memory usage is critical ($mem_used%)! Time to swab the decks!"
        return 1
    else
        print_success "Memory usage is shipshape ($mem_used%)"
    fi

    # Check disk space
    local disk_used=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
    if [ "$disk_used" -gt 90 ]; then
        print_error "Treasure chest is nearly full ($disk_used% used)! Clear some space!"
        return 1
    else
        print_success "Treasure chest has plenty of room ($disk_used% used)"
    fi

    # Check system load
    local load=$(uptime | awk -F'load average:' '{print $2}' | awk -F',' '{print $1}' | tr -d ' ')
    local cores=$(nproc)
    if (( $(echo "$load > $cores" | bc -l) )); then
        print_error "Ship's engines are overloaded (load: $load)! Reduce speed!"
        return 1
    else
        print_success "Ship's engines running smoothly (load: $load)"
    fi

    return 0
} 