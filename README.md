# ☠️ PowerCut Recovery Tool ☠️

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![Platform](https://img.shields.io/badge/platform-linux-lightgrey.svg)
![Pirate Approved](https://img.shields.io/badge/pirate-approved-FF1B1B.svg)

Ahoy matey! Welcome to the Gizmet PowerCut Recovery Tool - your trusty companion for when the seas get rough and your power goes down. This comprehensive system recovery and diagnostic tool is designed to help you navigate through the stormy aftermath of a power cut or system crash.

```
                    ⚡ ☠️  GIZMET PRESENTS ☠️ ⚡
              _____                          _____     _   
             |  __ \                        |  __ \   | |  
             | |__) |____      _____ _ __  | |__) |  | |_ 
             |  ___/ _ \ \ /\ / / _ \ '__| |  _  /   | __|
             | |  | (_) \ V  V /  __/ |    | | \ \   | |_ 
             |_|   \___/ \_/\_/ \___|_|    |_|  \_\   \__|
                                                
                    Your Power Recovery Companion
```

## 🏴‍☠️ Features

- **System Health Checks** ⚡
  - Memory usage monitoring (no memory leaks in this ship!)
  - Disk space verification (keep your treasure chest organized)
  - System load analysis (prevent your ship from sinking)

- **Display Configuration** 🖥️
  - X server status verification
  - DISPLAY variable validation
  - XDG_RUNTIME_DIR configuration

- **Network Diagnostics** 🌐
  - NetworkManager service status
  - Internet connectivity check (keep your compass pointing true)
  - Automatic recovery attempts

- **Camera System Recovery** 👁️
  - IP camera reachability test (keep your crow's nest operational)
  - RTSP port accessibility check
  - Automatic cleanup of stuck video processes

## 🏴‍☠️ Installation

1. Clone this treasure chest:
   ```bash
   git clone https://github.com/gizmetproton/powercut-recovery.git
   cd powercut-recovery
   ```

2. Run the install script (with your captain's privileges):
   ```bash
   sudo ./install.sh
   ```

   This will:
   - Copy scripts to your ship's hold (`/usr/local/share/powercut/`)
   - Create a magical portal (`/usr/local/bin/`)
   - Set the proper permissions (no stowaways allowed!)

## ⚓ Usage

Just raise the flag:
```bash
powercut
```

Your trusty script will automatically:
1. Check system resources (like a good first mate)
2. Verify display configuration (keep your maps visible)
3. Test network connectivity (maintain contact with other ships)
4. Ensure camera system is operational (keep watch for approaching storms)

Example output:
```bash
⚡ ☠️  GIZMET'S POWERCUT RECOVERY TOOL ☠️ ⚡

🏴‍☠️ Checking ship's vital signs...
  ⚔️  Memory usage is shipshape (25%)
  ⚔️  Treasure chest has plenty of room (18% used)
  ⚔️  Ship's engines running smoothly (load: 2.1)
```



The script is modular and easy to customize:
- `utils.sh` - Utility functions and pretty output
- `system.sh` - System health checks
- `display.sh` - Display configuration
- `network.sh` - Network diagnostics
- `camera.sh` - Camera system checks

Add your own modules or modify existing ones to suit your needs!

## 🤝 Contributing

Found a way to make our ship sail faster? Have ideas for new features? Feel free to:
- Open issues (report problems in the crow's nest)
- Submit pull requests (share your plunder with the crew)
- Suggest improvements (help us navigate better waters)

## 📜 License

MIT License - See LICENSE file for details (even pirates need rules!)

## 🏴‍☠️ About Gizmet

Gizmet creates pirate-themed tools for the modern Linux sailor. Our tools are:
- Fun and functional
- Easy to use
- Well documented
- Community driven

---
Made with ⚡ by Gizmet - Because every power cut is just another adventure! ☠️## 🗺️ Requirements

- Bash shell (your ship's helm)
- Linux system with NetworkManager (your navigation system)
  - Tested on EndeavourOS/Arch Linux
  - Should work on other Linux distributions with similar components
  - May need adjustments for different init systems (script uses systemctl)
- X server (your ship's windows)
- Standard Unix utilities (your basic toolset):
  - nc (netcat)
  - ping
  - df
  - free
  - systemctl
  - pkill/pgrep
