FROM centos

MAINTAINER "Ferdi Oeztuerk <foerdi@gmail.com>"

# download and (un)tar sqlrelay
RUN yum -y install wget && \
    cd /opt/ && \
	wget http://sourceforge.net/projects/sqlrelay/files/sqlrelay/1.4.0/sqlrelay-binary-distribution-1.4.0.tar.gz &&  \
    cd /opt/  && \
    tar xfz sqlrelay-binary-distribution-1.4.0.tar.gz && \
    rm -f sqlrelay-binary-distribution-1.4.0.tar.gz

# install sqlrelay binary distribution
RUN yum --assumeyes localinstall /opt/sqlrelay-binary-distribution-1.4.0/centos7x64/* && \
    rm -rf /opt/sqlrelay-binary-distribution-1.4.0

# download sqlrelay enterprise modules
RUN yum -y install wget && \
    cd /opt/ && \
	wget http://www.firstworks.com/sqlrenterprise/sqlrelay-enterprise-modules-1.4.0.tar.gz &&  \
    cd /opt/  && \
    tar xfz sqlrelay-enterprise-modules-1.4.0.tar.gz && \
    rm -f sqlrelay-enterprise-modules-1.4.0.tar.gz

# install sqlrelay enterprise modules
RUN yum --assumeyes localinstall /opt/sqlrelay-enterprise-modules-1.4.0/centos7x64/* && \
    rm -rf /opt/sqlrelay-enterprise-modules-1.4.0   

COPY sqlr-entrypoint.sh /bin/sqlr-entrypoint.sh

ENTRYPOINT ["sqlr-entrypoint.sh"]
