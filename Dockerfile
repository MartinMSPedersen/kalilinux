FROM kalilinux/kali-rolling
LABEL MAINTAINER="traxplayer@gmail.com"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade --yes --force-yes
RUN apt-get install --yes metasploit-framework tmux
RUN apt-get install --yes \
                       kali-tools-passwords \
                       kali-tools-reverse-engineering \
                       kali-tools-exploitation
RUN apt-get install --yes \
                       kali-tools-post-exploitation \
                       kali-tools-forensics
RUN apt-get install --yes \
                       kali-tools-information-gathering
RUN apt-get install --yes \
                       gobuster \
                       mlocate
RUN apt-get install --yes \
                       python-pip \
                       python3-pip \
   		       python-tk
RUN apt -y autoremove  && updatedb
RUN pip3 install pwn crypto selenium fabric
RUN apt-get install --yes libimage-exiftool-perl dirb mc
#RUN apt-get install openvas && openvas-setup
RUN apt-get install hashcash
#RUN /usr/bin/gunzip /usr/share/wordlists/rockyou.txt.gz && ln -s /usr/share/wordlists/rockyou.txt /rockyou.txt

RUN apt -y autoremove  && updatedb
RUN updatedb

ENTRYPOINT ["/bin/bash"]
