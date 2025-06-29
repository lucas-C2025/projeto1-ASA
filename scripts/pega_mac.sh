#!/bin/bash
ip link show eth1 | grep -oE "([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}" | head -n 1 > $(hostname)_mac
