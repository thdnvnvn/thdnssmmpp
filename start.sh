#!/bin/bash

# Đặt múi giờ Việt Nam (hoặc chỉnh theo bạn)
export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Cài curl nếu chưa có
apt-get update
apt-get install -y curl

# Cài sshx
curl -Ss https://sshx.io/get | sh

echo "=== SSHX session bắt đầu ==="
sshx
