FROM ubuntu:16.04

RUN apt-get update      &&      \
    apt-get -y install  curl    \
                        git     \
                        cmake   \
                        make    \
                        automake\
                        autoconf\
                        python  \
                        g++     \
                        zlib1g-dev


RUN curl http://dl.eventql.io/eventql/v0.4.1/eventql-0.4.1-linux_x86_64.tgz | tar xvz

COPY ./evqld.conf /etc/evqld.conf

RUN mkdir -p /var/evql

EXPOSE 9175

ENTRYPOINT ["/usr/local/bin/evqld",  "--datadir", "/var/evql"]
CMD ["--standalone"]
