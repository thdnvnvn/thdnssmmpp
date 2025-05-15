FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Cài curl, tzdata, openssh-client và tmate
RUN apt-get update && \
    apt-get install -y curl tzdata openssh-client gnupg software-properties-common && \
    ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    add-apt-repository ppa:tmate.io/archive -y && \
    apt-get update && \
    apt-get install -y tmate && \
    apt-get clean

# Sao chép script vào container
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Chạy script khi container khởi động
CMD ["/start.sh"]
