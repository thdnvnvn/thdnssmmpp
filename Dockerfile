FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Cài curl, tzdata và sshx
RUN apt-get update && \
    apt-get install -y curl tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# Sao chép script khởi động vào container
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Chạy script
CMD ["/start.sh"]
