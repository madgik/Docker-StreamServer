FROM ubuntu:14.04

# update
RUN apt-get -y update

# ssh
RUN apt-get install -y curl openssh-server
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

# java
RUN mkdir -p /usr/java/default && \
    curl -Ls 'http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie' | \
    tar --strip-components=1 -xz -C /usr/java/default/

ENV JAVA_HOME /usr/java/default/
ENV PATH $PATH:$JAVA_HOME/bin


# python
RUN sudo apt-get -y install python python-apsw

# stream server
ADD ExternalServer.tar.gz /root/

#ports
EXPOSE 8989

# entrypoint
WORKDIR /root/ExternalServer/
ENTRYPOINT java -jar ./dist/HttpExternalStreamSource.jar

