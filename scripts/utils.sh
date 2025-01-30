#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Print status message
print_status() {
    echo "🏴‍☠️ $1"
}

# Print success message
print_success() {
    echo "  ⚔️  $1"
}

# Print error message
print_error() {
    echo "  ☠️  $1"
} 