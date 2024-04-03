FROM centos:7
MAINTAINER Muromtsev Ilya <muromtsev.io@phystech.edu>

ENV     LD_LIBRARY_PATH=/usr/local/lib
ENV     CXXFLAGS="-fPIC -march=native -O2"
ENV	CFLAGS="-fPIC -march=native -O2"

RUN     yum install -y unzip which tar more util-linux-ng passwd openssh-clients openssh-server ed m4 wget sudo git net-tools iproute \
	bison flex libc-dev make perl-devel python-devel \
	perl-ExtUtils-Embed readline-devel apr-devel libevent-devel libyaml-devel libcurl-devel bzip2-devel libxml2-devel openssl-devel \
        centos-release-scl-rh centos-release-scl && yum install -y devtoolset-7-gcc devtoolset-7-gcc-c++ scl-utils

        #download source code
RUN     mkdir -p /usr/src/ &&  cd /usr/src && \ 
        git clone https://github.com/greenplum-db/gpdb.git

RUN	yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
	yum install -y cmake3

	#install libzstd and python packages
RUN	yum install -y epel-release \
	yum install -y libzstd-devel \
	yum install -y python3-devel \
	yum install -y python3-pip \
	yum install -y gcc python3-devel

        #install gpdb and dependencies
RUN     cd /usr/src/gpdb && mkdir -p /usr/local/gpdb && \
	git submodule init && git submodule update && \
	./README.Rhel-Rocky.bash && \
	source /opt/rh/devtoolset-7/enable && \ 	
        ./configure --with-perl --with-python --with-libxml --with-gssapi --prefix=/usr/local/gpdb && \
        make -j8 && \
        make -j8 install && \
        source /usr/local/gpdb/greenplum_path.sh

RUN	python3 -m pip install -U --upgrade pip \
	pip install setuptools --upgrade \
	pip install psutil 

        #cleanup
RUN     yum clean all && \ 
        chmod 755 /usr/local/gpdb/greenplum_path.sh && source /usr/local/gpdb/greenplum_path.sh       


	#set up gpdb
COPY    * /tmp/
RUN     cat /tmp/sysctl.conf.add >> /etc/sysctl.conf \
        && cat /tmp/limits.conf.add >> /etc/security/limits.conf \
        && rm -f /tmp/*.add \
        && chmod 777 /tmp/gpinitsystem.conf \
        && mv /tmp/discover_segments.sh /usr/local/bin/discover_segments.sh \
        && chmod 755 /usr/local/bin/discover_segments.sh \
        && mv /tmp/gpdb-entrypoint.sh /usr/local/bin/gpdb-entrypoint.sh \
        && mv /tmp/gpdb-seg-entrypoint.sh /usr/local/bin/gpdb-seg-entrypoint.sh \
        && chmod 755 /usr/local/bin/gpdb-entrypoint.sh \
        && chmod 755 /usr/local/bin/gpdb-seg-entrypoint.sh \
        && /usr/sbin/groupadd gpadmin \
        && /usr/sbin/useradd gpadmin -g gpadmin -G wheel \
        && echo "greenplum"|passwd --stdin gpadmin \
        && echo "gpadmin        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers \
        && mv /tmp/bash_profile /home/gpadmin/.bash_profile \
        && chown gpadmin:gpadmin /tmp/gpinitsystem.conf \
        && chown -R gpadmin: /home/gpadmin \
        && mkdir -p /gpdata/master /gpdata/segments \
        && chown -R gpadmin: /gpdata \
        && chown -R gpadmin: /usr/local/gpdb \
 	&& chown gpadmin:gpadmin /usr/local \
        && chown -R root:gpadmin /root \
	&& localedef -i en_US -f UTF-8 en_US.UTF-8 

RUN	pip install psycopg2-binary

USER gpadmin
ENV LOGNAME gpadmin
WORKDIR /home/gpadmin

	#transfer SSH keys
RUN 	mkdir .ssh && chmod 0700 .ssh && cd .ssh \
        && ssh-keygen -f id_rsa -t rsa -N '' \
        && touch authorized_keys \
        && chmod 0600 auth* id* \
        && chmod 0644 id*.pub \
        && cat id_rsa.pub | sed 's/@.*$/@master_1/' >> authorized_keys

ENV MASTER_DATA_DIRECTORY=/gpdata/master/gpseg-1

EXPOSE 5432 22

VOLUME /gpdata

ENTRYPOINT ["gpdb-entrypoint.sh"]


