# NixOS Lightweight and Stable Setup Guide with Flakes

This guide provides step-by-step instructions to install NixOS from scratch and configure a lightweight, stable daily-use environment using **Flakes**. It includes **LightDM** (lightweight display manager), **Niri** (Wayland compositor), **Zen Browser**, **Neovim** (with your `init.lua`), **Node.js**, **OpenTabletDriver**, and gaming tools (Steam, Proton, Lutris). The setup minimizes resource usage while ensuring stability for coding, browsing, gaming, and creative work (e.g., tablet drawing).

## Prerequisites
- **Hardware**: Laptop/PC with ≥4GB RAM, ≥20GB disk space, supported GPU (Nvidia/AMD/Intel).
- **USB Drive**: ≥4GB for NixOS live ISO.
- **Internet**: Wired preferred; Wi-Fi instructions included.
- **Hardware Info**: Know your laptop model (e.g., Dell XPS), GPU, and tablet model (e.g., Huion, Wacom).
- **Backup**: Save existing data, as the disk will be wiped.
- **Neovim `init.lua`**: Have your configuration file ready (e.g., on USB or online).
- **Date**: As of July 16, 2025, use the latest NixOS 24.11 ISO.

## Step 1: Prepare the NixOS Live USB
1. **Download ISO**:
   - Visit `nixos.org/download` and download the **minimal ISO** (e.g., `nixos-minimal-24.11-x86_64-linux.iso`).
   - Verify checksum (optional):
     ```bash
     sha256sum nixos-minimal-24.11-x86_64-linux.iso
     ```

2. **Create Bootable USB**:
   - **Linux/Mac**:
     ```bash
     sudo dd if=nixos-minimal-24.11-x86_64-linux.iso of=/dev/sdX bs=4M status=progress
     ```
     Replace `/dev/sdX` with your USB device (check with `lsblk`).
   - **Windows**: Use Rufus or Etcher.
   - Eject USB safely.

3. **Boot from USB**:
   - Insert USB into the target system.
   - Enter BIOS/UEFI (`F2`, `Del`, or `F12` during boot).
   - Set USB as first boot device and save.
   - Boot into NixOS live environment.

## Step 2: Partition and Format the Disk
1. **Identify Disk**:
   ```bash
   lsblk
   ```
   Note the target disk (e.g., `/dev/sda` or `/dev/nvme0n1`).

2. **Partition (UEFI)**:
   - Use `parted` for UEFI systems:
     ```bash
     parted /dev/sda
     ```
     - `mklabel gpt`
     - EFI partition: `mkpart ESP fat32 1MiB 512MiB`, `set 1 esp on`
     - Root partition: `mkpart primary ext4 512MiB 100%`
     - `quit`
   - **BIOS (Legacy)**:
     ```bash
     fdisk /dev/sda
     ```
     Create one `ext4` primary partition (full disk).

3. **Format Partitions**:
   - UEFI:
     ```bash
     mkfs.fat -F 32 /dev/sda1
     mkfs.ext4 /dev/sda2
     ```
   - BIOS:
     ```bash
     mkfs.ext4 /dev/sda1
     ```

4. **Mount Partitions**:
   - UEFI:
     ```bash
     mount /dev/sda2 /mnt
     mkdir -p /mnt/boot
     mount /dev/sda1 /mnt/boot
     ```
   - BIOS:
     ```bash
     mount /dev/sda1 /mnt
     ```

## Step 3: Install NixOS
1. **Generate Configuration**:
   ```bash
   nixos-generate-config --root /mnt
   ```
   Creates `/mnt/etc/nixos/hardware-configuration.nix` and `/mnt/etc/nixos/configuration.nix`.

2. **Enable Flakes and Basic Settings**:
   ```bash
   nano /mnt/etc/nixos/configuration.nix
   ```
   Add:
   ```nix
   {
     nix.settings.experimental-features = [ "nix-command" "flakes" ];
     networking.networkmanager.enable = true; # For Wi-Fi
     boot.loader.systemd-boot.enable = true; # UEFI
     boot.loader.efi.canTouchEfiVariables = true;
     # For BIOS, replace with:
     # boot.loader.grub.enable = true;
     # boot.loader.grub.device = "/dev/sda";
   }
   ```
   Save and exit (`Ctrl+O`, `Enter`, `Ctrl+X`).

3. **Connect to Network** (if Wi-Fi):
   ```bash
   nmtui
   ```

4. **Install**:
   ```bash
   nixos-install
   ```
   Set root password when prompted:
   ```bash
   passwd
   ```

5. **Reboot**:
   ```bash
   umount -R /mnt
   reboot
   ```
   Remove USB after shutdown.

## Step 4: Set Up Lightweight Environment with Flakes
1. **Log In**:
   - Log in as `root`.
   - Verify: `nixos-version`.

2. **Create `flake.nix`**:
   ```bash
   sudo nvim /etc/nixos/flake.nix
   ```
   Add:
   ```nix
   {
     description = "Lightweight NixOS with LightDM, Niri, and Zen Browser";

     inputs = {
       nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
       nixos-hardware.url = "github:NixOS/nixos-hardware/master";
       nix-gaming.url = "github:fufexan/nix-gaming";
       zen-browser.url = "github:MarceColl/zen-browser-flake";
       niri.url = "github:YaLTeR/niri";
     };

     outputs = { self, nixpkgs, nixos-hardware, nix-gaming, zen-browser, niri, ... }: {
       nixosConfigurations.my-laptop = nixpkgs.lib.nixosSystem {
         system = "x86_64-linux"; # Adjust for arm64
         modules = [
           nixos-hardware.nixosModules.dell-xps-13-9380 # Replace with your laptop
           nix-gaming.nixosModules.default
           ./hardware-configuration.nix
           {
             # Networking
             networking.networkmanager.enable = true;
             # Display Manager (LightDM)
             services.xserver.enable = true;
             services.xserver.displayManager.lightdm = {
               enable = true;
               greeters.mini = {
                 enable = true; # Lightweight greeter
                 user = "your-username"; # Replace with your user
               };
             };
             # Niri
             programs.niri = {
               enable = true;
               package = niri.packages."x86_64-linux".niri;
             };
             # Packages (minimal set)
             environment.systemPackages = with nixpkgs.legacyPackages.x86_64-linux; [
               (neovim.override {
                 configure = {
                   customRC = ''
                     lua << EOF
                     ${builtins.readFile ./init.lua}
                     EOF
                   '';
                   packages.myVimPackage = with nixpkgs.legacyPackages.x86_64-linux.vimPlugins; {
                     start = [ lazy-nvim telescope-nvim ];
                   };
                 };
               })
               nodejs_20
               opentabletdriver
               protonup-qt
               mangohud
               lutris
               zen-browser.packages."x86_64-linux".default
               niri.packages."x86_64-linux".niri
               foot # Lightweight terminal
               wofi # Lightweight launcher
               wl-clipboard
               krita
               xwayland-satellite
               ripgrep
               fd
             ];
             # Drivers
             hardware.opengl = {
               enable = true;
               driSupport = true;
               driSupport32Bit = true;
             };
             services.xserver.videoDrivers = [ "nvidia" ]; # Adjust: "amdgpu" or "modesetting"
             hardware.nvidia = {
               modesetting.enable = true;
               prime = {
                 offload = { enable = true; enableOffloadCmd = true; };
                 nvidiaBusId = "PCI:1:0:0"; # Replace
                 intelBusId = "PCI:0:2:0"; # Replace
               };
               package = config.boot.kernelPackages.nvidiaPackages.stable;
             };
             # Gaming
             programs.steam = {
               enable = true;
               remotePlay.openFirewall = true;
             };
             programs.gamemode.enable = true;
             services.pipewire = {
               enable = true;
               alsa.enable = true;
               alsa.support32Bit = true;
               pulse.enable = true;
               lowLatency = { enable = true; quantum = 64; rate = 48000; };
             };
             security.rtkit.enable = true;
             # Tablet
             hardware.opentabletdriver.enable = true;
             # Misc
             nix.settings.experimental-features = [ "nix-command" "flakes" ];
             nixpkgs.config.allowUnfree = true;
             # User
             users.users.your-username = {
               isNormalUser = true;
               extraGroups = [ "wheel" "networkmanager" ];
               initialPassword = "temporary"; # Change after login
             };
           }
         ];
       };
     };
   }
   ```
   - **Notes**:
     - Replace `dell-xps-13-9380` with your laptop’s module (check `github.com/NixOS/nixos-hardware`). Remove if not needed.
     - Replace `my-laptop` with your hostname (`hostname`).
     - Replace `your-username` with your desired username.
     - Find GPU bus IDs:
       ```bash
       nix-shell -p pciutils --run "lspci | grep -E 'VGA|3D'"
       ```
     - Copy `init.lua`:
       ```bash
       sudo cp /path/to/your/init.lua /etc/nixos/init.lua
       ```
     - Use `zen-browser.packages."x86_64-linux".generic` for older CPUs.
     - Replaced `alacritty`/`fuzzel` with `foot`/`wofi` for lower resource usage.

3. **Create User**:
   - Log in as `your-username` (password: `temporary`).
   - Change password:
     ```bash
     passwd
     ```

4. **Check and Update Flake**:
   ```bash
   cd /etc/nixos
   nix flake check
   nix flake update
   ```

5. **Apply**:
   ```bash
   sudo nixos-rebuild switch --flake /etc/nixos
   ```

## Step 5: Configure Niri
1. **Create `~/.config/niri/config.kdl`**:
   ```bash
   mkdir -p ~/.config/niri
   nvim ~/.config/niri/config.kdl
   ```
   Add:
   ```kdl
   input {
       keyboard {
           xkb {
               layout "us"
           }
       }
   }
   output "eDP-1" {
       mode "1920x1080@60Hz" # Adjust
       scale 1.0
   }
   binds {
       "Super+B" { spawn "zen"; }
       "Super+T" { spawn "foot"; }
       "Super+D" { spawn "wofi --show drun"; }
   }
   ```
   Find display name:
   ```bash
   nix-shell -p wlr-randr --run "wlr-randr"
   ```

2. **Test Niri** (Optional):
   ```bash
   niri --session
   ```

## Step 6: Start Niri with LightDM
1. **Reboot**:
   ```bash
   reboot
   ```

2. **Select Niri**:
   - At LightDM’s mini greeter (text-based, lightweight), log in as `your-username`.
   - Niri should start automatically if `programs.niri.enable = true;`.
   - If no session chooser appears, ensure `/run/current-system/sw/share/wayland-sessions/niri.desktop` exists.

## Step 7: Verify Daily-Use Environment
- **Neovim**: `nvim --version`, `:checkhealth`, `:Lazy sync`.
- **Node.js**: `node --version`.
- **Zen Browser**: `zen --version` or launch via Wofi (`Super+D`, type `zen`).
- **Gaming**: `steam`, `lutris`, or `nvidia-offload steam` (Nvidia).
- **Tablet**: Test in Krita (`krita`):
  ```bash
  nix-shell -p evtest --run "evtest"
  ```
- **Wayland**: `echo $XDG_SESSION_TYPE` (should output `wayland`).

## Step 8: Troubleshooting
- **Niri Not Starting**:
  ```bash
  ls /run/current-system/sw/share/wayland-sessions/niri.desktop
  sudo nixos-rebuild switch --flake /etc/nixos
  ```
- **Black Screen**:
  Add to `~/.config/niri/config.kdl`:
  ```kdl
  output "eDP-1" {
      render-device "/dev/dri/card0"
  }
  ```
  Check: `ls -l /dev/dri/`.
- **Zen Browser Fails**:
  ```bash
  nix flake update
  sudo nixos-rebuild switch --flake /etc/nixos
  ```
- **Neovim Errors**:
  ```bash
  rm -rf ~/.local/share/nvim ~/.cache/nvim
  nvim
  :Lazy sync
  ```
- **Rollback**:
  ```bash
  sudo nixos-rebuild --rollback switch
  ```

## Step 9: Daily Maintenance
- **Update**:
  ```bash
  nix flake update
  sudo nixos-rebuild switch --flake /etc/nixos
  ```
- **Clean Up**:
  ```bash
  sudo nix-collect-garbage -d
  sudo nix-store --optimise
  ```

## Notes
- **Lightweight Design**: LightDM’s `mini` greeter and Niri use minimal resources (~100MB RAM vs. ~500MB for GNOME). `foot` and `wofi` are lighter than Alacritty/Fuzzel.
- **Stability**: Flakes pin dependencies, and NixOS’s rollback ensures stability. Stick to `nixos-24.11` for tested packages.
- **Customization**: Add Niri keybindings or packages (e.g., `firefox`, `libreoffice`) to `flake.nix`.
- **Hardware**: Adjust `nixos-hardware` and GPU settings (`nvidia`, `amdgpu`, or `modesetting`).
- **Resources**: NixOS Wiki (wiki.nixos.org/wiki/Flakes), Niri GitHub (github.com/YaLTeR/niri).