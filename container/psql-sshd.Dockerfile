FROM postgres:14.4

# # ssh login できるようにする
# RUN apt-get update -y && \
# 	apt-get install openssh-server -y && \
# 	apt-get clean all -y \
# 	apt autoremove -y

# ARG PSWD
# # root user の password 設定
# RUN echo 'root:${PSWD}' | chpasswd

# sshd の設定
# root アクセス許可 
# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# パスワードアクセス許可
# RUN sed -i 's/#PasswordAuthentication/PasswordAuthentication/' /etc/ssh/sshd_config

# ENTRYPOINT ["/usr/sbin/sshd", "-D"]

