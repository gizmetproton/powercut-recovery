#!/bin/bash

# Source utility functions
source "$(dirname "$0")/utils.sh"

check_camera() {
    print_status "Checking crow's nest (camera) status..."
    
    # Check if camera is reachable
    if ! ping -c 1 192.168.1.165 >/dev/null 2>&1; then
        print_error "Can't spot the crow's nest! Camera not responding!"
        return 1
    else
        print_success "Crow's nest spotted on the horizon"
    fi

    # Check if RTSP port is accessible
    if ! nc -z 192.168.1.165 554 >/dev/null 2>&1; then
        print_error "Crow's nest viewing port is blocked! Check port 554"
        return 1
    else
        print_success "Crow's nest viewing port is clear"
    fi

    # Check for stuck video processes
    if pgrep -x "mpv\|ffmpeg\|ffplay\|vlc" >/dev/null; then
        print_error "Found some scurvy processes! Sending them to Davy Jones..."
        pkill -9 mpv ffmpeg ffplay vlc
        print_success "The deck is clear!"
    fi

    print_success "All crow's nest systems operational"
    return 0
} 