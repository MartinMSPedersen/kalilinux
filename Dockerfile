FROM kalilinux/kali-rolling
LABEL MAINTAINER="traxplayer@gmail.com"
ARG DEBIAN_FRONTEND=noninteractive

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get upgrade --yes --force-yes
RUN apt-get install --yes apt-utils
RUN apt-get install --yes \
                       dirb \
                       mc \
                       gobuster \
                       mlocate \
                       python3-pip \
                       python-tk \
                       libimage-exiftool-perl \
                       vim vim-common vim-doc vim-scripts vim-doc \
                       whois \
                       wabt \
                       wfuzz \
                       qpdf \
                       tmux \
                       sublist3r \
                       libgmp3-dev libmpc-dev \
                       bind9-dnsutils \
                       lynx \
                       iputils-ping \
                       telnet \
                       bloodhound \
                       sleuthkit \
                       testdisk \
                       dos2unix \
                       zbar-tools \
                       steghide \
                       ftp \
                       mariadb-client \
                       ncftp \
                       john john-data 
RUN apt-get install --yes metasploit-framework
RUN apt-get install --yes kali-tools-passwords
RUN apt-get install --yes kali-tools-reverse-engineering
RUN apt-get install --yes kali-tools-exploitation
RUN apt-get install --yes kali-tools-post-exploitation
RUN apt-get install --yes kali-tools-forensics
RUN apt-get install --yes kali-tools-information-gathering
RUN pip3 install pwn pycrypto selenium fabric
RUN nmap --script-updatedb
RUN gunzip /usr/share/wordlists/rockyou.txt.gz
RUN wget https://github.com/n00py/WPForce/archive/master.zip && unzip master.zip && rm master.zip

RUN searchsploit -u || true # 2GB

RUN wget -O /usr/local/bin/LinEnum.sh https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh

RUN pip3 install sympy
RUN wget -O xor.zip https://github.com/MartinMSPedersen/xor/archive/refs/heads/master.zip && unzip xor.zip && rm xor.zip && cd xor-master && make && mv xor /usr/local/bin && cd .. && rm -r xor-master

RUN apt install wordlists --reinstall # why is this missing

ADD https://raw.githubusercontent.com/MartinMSPedersen/kali/master/generate_password /usr/local/bin/
ADD https://github.com/vi/websocat/releases/download/v1.10.0/websocat.x86_64-unknown-linux-musl /usr/local/bin/websocat

RUN chmod +x /usr/local/bin/generate_password /usr/local/bin/websocat

RUN apt-get install --yes redis-tools

RUN apt-get -y autoremove && updatedb
WORKDIR /src
RUN git clone https://github.com/lgandx/Responder

ENTRYPOINT ["/bin/bash"]
