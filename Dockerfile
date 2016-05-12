FROM ubuntu:16.04

# stream server
ADD ExternalServer.tar.gz /root/

#ports
EXPOSE 8989

# entrypoint
WORKDIR /root/
ENTRYPOINT ./streamserver -port 8989 -dirname ./datasets/

