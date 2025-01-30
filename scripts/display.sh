#!/bin/bash

# Source utility functions
source "/usr/local/share/powercut/utils.sh"

check_display() {
    print_status "Checking display configuration..."
    
    # Check if X server is running
    if ! ps aux | grep -v grep | grep -q Xorg; then
        print_error "X server not running. You may need to run: sudo systemctl restart display-manager"
        return 1
    else
        print_success "X server is running"
    fi

    # Check DISPLAY environment variable
    if [ -z "$DISPLAY" ]; then
        print_error "DISPLAY variable not set. Setting to :1..."
        export DISPLAY=:1
    else
        print_success "DISPLAY variable is set to $DISPLAY"
    fi

    # Check XDG_RUNTIME_DIR
    if [ -z "$XDG_RUNTIME_DIR" ]; then
        print_error "XDG_RUNTIME_DIR not set. Setting it..."
        export XDG_RUNTIME_DIR="/run/user/$(id -u)"
    else
        print_success "XDG_RUNTIME_DIR is set to $XDG_RUNTIME_DIR"
    fi

    return 0
} 