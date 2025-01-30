#!/bin/bash

# Source utility functions
source "/usr/local/share/powercut/utils.sh"

check_camera() {
    print_status "Checking Tapo camera connectivity..."

    # Camera details
    CAMERA_IP="192.168.1.165"
    CAMERA_PORT="554"

    # Check if camera is reachable
    if ! ping -c 1 -W 1 $CAMERA_IP >/dev/null 2>&1; then
        print_error "Cannot reach camera at $CAMERA_IP"
        print_error "Check if camera is powered on and connected to network"
        return 1
    else
        print_success "Camera is reachable"
        
        # Check RTSP port
        if nc -z -w1 $CAMERA_IP $CAMERA_PORT 2>/dev/null; then
            print_success "Camera RTSP port is accessible"
        else
            print_error "Cannot access camera RTSP port"
            print_error "Check if camera RTSP service is running"
            return 1
        fi
    fi

    # Check for stuck video processes
    if pgrep -x mpv >/dev/null; then
        print_error "Found stuck mpv processes. Killing them..."
        pkill -9 mpv
    fi

    for proc in ffmpeg ffplay vlc; do
        if pgrep -x $proc >/dev/null; then
            print_error "Found stuck $proc process. Killing it..."
            pkill -9 $proc
        fi
    done

    print_success "Camera checks completed"
    return 0
} 