#!/bin/bash

# Source utility functions
source "/usr/local/share/powercut/utils.sh"

check_system() {
    print_status "Checking system resources..."

    # Check memory usage
    MEM_USAGE=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
    if [ $MEM_USAGE -gt 90 ]; then
        print_error "High memory usage ($MEM_USAGE%)"
        print_error "You may need to run: sudo sync && sudo echo 3 > /proc/sys/vm/drop_caches"
        return 1
    else
        print_success "Memory usage is normal ($MEM_USAGE%)"
    fi

    # Check disk space
    DISK_USAGE=$(df -h / | tail -1 | awk '{print int($5)}')
    if [ $DISK_USAGE -gt 90 ]; then
        print_error "Low disk space ($DISK_USAGE% used)"
        print_error "Consider cleaning up some files"
        return 1
    else
        print_success "Disk space is normal ($DISK_USAGE% used)"
    fi

    # Check system load
    LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | tr -d ' ')
    CORES=$(nproc)
    if (( $(echo "$LOAD > $CORES" | bc -l) )); then
        print_error "High system load ($LOAD)"
        print_error "You might want to check: top"
    else
        print_success "System load is normal ($LOAD)"
    fi

    return 0
} 