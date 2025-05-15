#!/bin/bash

# Đặt múi giờ không cần tương tác
export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Cập nhật gói và cài curl
apt-get update
apt-get install -y curl

# Cài đặt sshx
curl -Ss https://sshx.io/get | sh

# Chạy sshx và in link
echo "=== Bắt đầu phiên SSHX ==="
sshx
