# Ubuntu Version

This folder is a standalone Ubuntu/Linux package of the project.

Contents included here:
- controller code
- topology code
- timeout/policy module
- scripts
- tests
- artifacts
- sample controller and Mininet output logs

## Ubuntu Packages

```bash
sudo apt update
sudo apt install -y python3 python3-venv python3-pip build-essential \
  openvswitch-switch mininet iperf3 tcpdump net-tools socat ethtool
```

## Python Environment

From this folder:

```bash
python3 -m venv .venv
.venv/bin/python -m pip install --upgrade pip setuptools wheel
.venv/bin/python -m pip install -r requirements.txt
```

## Start Open vSwitch

```bash
sudo service openvswitch-switch start
sudo service openvswitch-switch status
```

## Run The Project

Terminal 1:

```bash
./scripts/run_controller.sh
```

Terminal 2:

```bash
./scripts/run_topology.sh
```

## Demo Commands

Use:

```bash
cat scripts/demo_commands.txt
```

## Validation

```bash
.venv/bin/python -m unittest discover -s tests -v
.venv/bin/python -m py_compile controller/timeout_manager.py topology/timeout_topology.py flow_timeout_manager/config.py flow_timeout_manager/policy.py tests/test_policy.py scripts/ryu_compat.py
```

## Evidence Collection

While Mininet is running:

```bash
./scripts/collect_evidence.sh
```

The flow dumps will be saved under `artifacts/`.

## Optional Ubuntu Helper

You can also use the Ubuntu helper script:

```bash
chmod +x ubuntu/setup_ubuntu.sh
./ubuntu/setup_ubuntu.sh
```
