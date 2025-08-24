#!/bin/bash
clear

while true; do
    echo "=== MENU QUẢN LÝ XRDP PROOT ==="
    echo "1) Cài đặt XRDP + LXDE (fix trong proot)"
    echo "2) Khởi động lại XRDP + LXDE"
    echo "3) Mở tunnel Pinggy (public RDP)"
    echo "4) Fix /etc/hosts (thêm 127.0.0.1 localhost nếu chưa có)"
    echo "0) Thoát"
    read -p "Chọn [0-4]: " opt

    case "$opt" in
        1)
            echo "=== Cài đặt XRDP + LXDE ==="
            apt update -y
            apt install -y xrdp lxde-core dbus-x11
            echo "startlxde" > ~/.xsession
            echo "[OK] Cài đặt xong. Chọn 2 để khởi động XRDP."
            ;;
        2)
            echo "=== Khởi động lại XRDP + LXDE ==="
            pkill xrdp
            pkill xrdp-sesman
            sleep 2
            /usr/sbin/xrdp-sesman &
            /usr/sbin/xrdp -n &
            echo "[OK] XRDP đã chạy. Kết nối bằng RDP client (user: root)."
            ;;
        3)
            echo "=== Mở tunnel Pinggy ==="
            ssh -p 443 -o StrictHostKeyChecking=no -o ServerAliveInterval=30 -R0:localhost:3389 tcp@a.pinggy.io
            ;;
        4)
            echo "=== Fix /etc/hosts ==="
            grep -q "127.0.0.1   localhost" /etc/hosts || echo "127.0.0.1   localhost" >> /etc/hosts
            echo "[OK] Đã thêm localhost nếu chưa có."
            ;;
        0)
            echo "Thoát."
            exit 0
            ;;
        *)
            echo "Lựa chọn không hợp lệ!"
            ;;
    esac
    echo
done
