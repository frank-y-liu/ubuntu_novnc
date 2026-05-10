# ubuntu_novnc

Lightweight Ubuntu desktop containers with browser-based access through noVNC.

This repository provides two small desktop environments intended for use with Docker on Colima, especially on Apple Silicon Macs:

- **XFCE**: Xubuntu-style desktop using XFCE
- **LXQt**: Lubuntu-style desktop using LXQt

The containers are designed to run with about **1 GB of Colima memory**, using a Docker memory cap of **768 MB**, and expose the desktop through a browser at:

```text
http://localhost:6901/vnc.html?password=developer
```

The current working directory on the host is mounted inside the container at:

```text
/source
```

## Repository layout

```text
.
├── Dockerfile.xfce.arm64      # XFCE/Xubuntu-style desktop image for ARM64
├── Dockerfile.lxqt.arm64      # LXQt/Lubuntu-style desktop image for ARM64
├── Makefile                   # Build targets for the images
├── run_xfce.sh                # Run the XFCE container
├── run_lxqt.sh                # Run the LXQt container
├── scripts/
│   ├── startup_xfce.sh        # Starts XFCE, VNC, and noVNC
│   └── startup_lxqt.sh        # Starts LXQt, VNC, and noVNC
└── LICENSE
```

## Requirements

On macOS:

- Colima
- Docker CLI
- A browser

Recommended Colima configuration for a lightweight desktop:

```bash
colima start --arch aarch64 --cpu 2 --memory 1 --disk 20
```

### Build the XFCE image

```bash
make build_xfce
```


### Build the LXQt image

```bash
make build_lxqt
```


## Run

### Run the XFCE desktop

```bash
./run_xfce.sh
```


### Run the LXQt desktop

```bash
./run_lxqt.sh
```

Then open:

```text
http://localhost:6901/vnc.html?password=developer
```

Default VNC password:

```text
developer
```


## Desktop environments

### XFCE image

The XFCE image provides a lightweight Xubuntu-style desktop. It includes:

- XFCE session, panel, window manager, and desktop
- XFCE terminal
- Thunar file manager
- Mousepad text editor
- noVNC and TigerVNC
- common command-line tools

### LXQt image

The LXQt image provides a lightweight Lubuntu-style desktop. It includes:

- LXQt session, panel, and configuration tools
- Openbox window manager
- QTerminal
- PCManFM-Qt file manager
- noVNC and TigerVNC
- common command-line tools, including Python and build tools

## Mounted source directory

The run scripts mount the current host directory into the container:

```bash
-v "$(pwd)":/source
```

Inside the desktop, your current directory appears as:

```text
/source
```

## Notes on architecture

The provided Dockerfiles are ARM64-specific:

```text
Dockerfile.xfce.arm64
Dockerfile.lxqt.arm64
```

They are intended for Apple Silicon / ARM64 Colima environments. To support x86_64/amd64, add corresponding Dockerfiles such as:

```text
Dockerfile.xfce.amd64
Dockerfile.lxqt.amd64
```

or refactor the Makefile and Dockerfiles to use a shared multi-architecture Dockerfile.

## License

MIT License.


