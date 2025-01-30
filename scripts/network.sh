#!/bin/bash

# Source utility functions
source "$(dirname "$0")/utils.sh"

check_network() {
    print_status "Checking ship's navigation systems..."
    
    # Check if NetworkManager is running
    if ! systemctl is-active --quiet NetworkManager; then
        print_error "NetworkManager has abandoned ship! Attempting to restart..."
        sudo systemctl restart NetworkManager
        sleep 2
        if ! systemctl is-active --quiet NetworkManager; then
            print_error "Failed to bring NetworkManager back aboard!"
            return 1
        fi
    else
        print_success "NetworkManager is standing watch"
    fi

    # Check internet connectivity
    if ! ping -c 1 8.8.8.8 >/dev/null 2>&1; then
        print_error "Lost contact with the mainland (no internet)!"
        return 1
    else
        print_success "Ship's communications are operational"
    fi

    return 0
} 