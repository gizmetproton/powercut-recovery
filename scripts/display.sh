#!/bin/bash

# Source utility functions
source "$(dirname "$0")/utils.sh"

check_display() {
    print_status "Checking ship's viewing ports..."
    
    # Check if X server is running
    if ! ps aux | grep -v grep | grep -q Xorg; then
        print_error "Ship's windows are shuttered! X server not running"
        print_error "Try: sudo systemctl restart display-manager"
        return 1
    else
        print_success "Ship's windows are crystal clear"
    fi

    # Check DISPLAY environment variable
    if [ -z "$DISPLAY" ]; then
        print_error "Lost sight of the display! Setting course to :1..."
        export DISPLAY=:1
    else
        print_success "Display coordinates locked at $DISPLAY"
    fi

    # Check XDG_RUNTIME_DIR
    if [ -z "$XDG_RUNTIME_DIR" ]; then
        print_error "Ship's runtime quarters not found! Setting them up..."
        export XDG_RUNTIME_DIR="/run/user/$(id -u)"
    else
        print_success "Ship's runtime quarters established at $XDG_RUNTIME_DIR"
    fi

    return 0
} 