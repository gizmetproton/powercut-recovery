#!/bin/bash

# Source utility functions
source "/usr/local/share/powercut/utils.sh"

check_network() {
    print_status "Checking network services..."

    # Check NetworkManager
    if ! systemctl is-active --quiet NetworkManager; then
        print_error "NetworkManager is not running. You may need to run: sudo systemctl restart NetworkManager"
        return 1
    else
        print_success "NetworkManager is running"
    fi

    # Check network connectivity
    if ! ping -c 1 8.8.8.8 >/dev/null 2>&1; then
        print_error "No internet connectivity. You may need to restart your network interface"
        print_error "Try: sudo ip link set dev \$(ip route | grep default | awk '{print \$5}') down"
        print_error "Then: sudo ip link set dev \$(ip route | grep default | awk '{print \$5}') up"
        return 1
    else
        print_success "Internet connectivity is working"
    fi

    return 0
} 