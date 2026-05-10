#!/usr/bin/env bash
set -euxo pipefail

mkdir -p "$HOME/.vnc"

cat > "$HOME/.vnc/xstartup" <<'EOF'
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export SHELL=/bin/bash
exec startxfce4
EOF

chmod +x "$HOME/.vnc/xstartup"

echo "${PASSWORD:-developer}" | vncpasswd -f > "$HOME/.vnc/passwd"
chmod 600 "$HOME/.vnc/passwd"

vncserver -kill "$DISPLAY" >/dev/null 2>&1 || true

vncserver "$DISPLAY" \
  -geometry "${RESOLUTION:-1600x900}" \
  -depth "${DEPTH:-24}" \
  -localhost yes

exec websockify \
  --web=/usr/share/novnc \
  "${NOVNC_PORT:-6901}" \
  "localhost:${VNC_PORT:-5901}"
