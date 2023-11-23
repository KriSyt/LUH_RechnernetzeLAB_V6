FROM ubuntu:latest

RUN apt-get -qq update && apt-get -qq -y install net-tools iputils-ping iperf openssh-server sshpass traceroute iptables iproute2 ethtool sudo tcpdump netcat git build-essential
RUN cd /root && git clone https://github.com/brentondwalker/spruce.git && cd spruce && make clean; make
RUN cd /root && git clone https://github.com/brentondwalker/wbest.git && cd wbest && make clean; make
RUN cd /root && git clone https://github.com/brentondwalker/DietTopp.git && cd DietTopp && make clean; make
RUN cd /root && git clone https://github.com/brentondwalker/pathload.git && cd pathload && ./configure &&make
# RUN cd /root && git clone https://github.com/brentondwalker/pathchirp.git && cd pathchirp &&./configure && make

ENV PATH="$PATH:/root/spruce:/root/wbest:/root/DietTopp:/root/pathload:/root/pathchirp/Bin/x86_64"


RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]