#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

echo "=== Đang khởi động phiên tmate ==="

# Tạo session mới
tmate -S /tmp/tmate.sock new-session -d

# Đợi session sẵn sàng
tmate -S /tmp/tmate.sock wait tmate-ready

# In ra link SSH và Web
tmate -S /tmp/tmate.sock display -p "SSH: #{tmate_ssh}"
tmate -S /tmp/tmate.sock display -p "Web: #{tmate_web}"

# Giữ container chạy mãi
tail -f /dev/null
