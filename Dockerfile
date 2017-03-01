FROM ubuntu:16.04
RUN apt-get update && apt-get install gcc g++ cmake make git wget mc curl libssl-dev libgtest-dev libeigen3-dev  libboost-all-dev ccache python3 python librocksdb-dev libquantlib0-dev libcpprest-dev tightvncserver valgrind gdb --force-yes --assume-yes 
COPY ./keyboard /etc/default/keyboard
RUN apt-get update && apt-get install locales locales-all --force-yes --assume-yes 
RUN locale-gen ru_RU.UTF-8  
ENV LANG ru_RU.UTF-8  
ENV LANGUAGE ru_RU:en  
ENV LC_ALL ru_RU.UTF-8  
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install xubuntu-desktop --force-yes --assume-yes
RUN apt-get update && apt-get install terminator firefox iotop htop net-tools iputils-ping telnet chromium-browser  --force-yes --assume-yes
RUN apt-get update && apt-get install openjdk-8-jdk openjdk-8-jre --force-yes --assume-yes
RUN apt-get update && apt-get install ninja-build remmina --force-yes --assume-yes
RUN add-apt-repository ppa:webupd8team/sublime-text-3 && apt-get update && sudo apt-get install sublime-text-installer
RUN apt-get update && apt-get install p7zip-full --force-yes --assume-yes
RUN apt-get update && apt-get install libgoogle-glog-dev --force-yes --assume-yes
RUN apt-get update && apt-get install tdsodbc unixodbc-dev --force-yes --assume-yes
RUN apt-get update && apt-get install git-gui --force-yes --assume-yes
COPY ./turbovnc*.deb /tmp/turbovnc.deb
RUN dpkg -i /tmp/turbovnc.deb
COPY ./odbcinst.ini /etc/odbcinst.ini

RUN mkdir /home/dev
VOLUME /home/dev
CMD ["bash"]
EXPOSE 5901
