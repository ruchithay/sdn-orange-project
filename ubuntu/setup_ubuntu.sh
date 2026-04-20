#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

sudo apt update
sudo apt install -y python3 python3-venv python3-pip build-essential \
  openvswitch-switch mininet iperf3 tcpdump net-tools socat ethtool

python3 -m venv "$ROOT_DIR/.venv"
"$ROOT_DIR/.venv/bin/python" -m pip install --upgrade pip setuptools wheel
"$ROOT_DIR/.venv/bin/python" -m pip install -r "$ROOT_DIR/requirements.txt"

printf 'Ubuntu setup completed in %s\n' "$ROOT_DIR"
