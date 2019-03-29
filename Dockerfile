FROM centos:latest

LABEL maintainer "Ferdi Oeztuerk <foerdi@gmail.com>"

# download and extract sqlrelay binary distribution
RUN yum -y install wget && \
    cd /opt/ && \
	wget http://sourceforge.net/projects/sqlrelay/files/sqlrelay/1.4.0/sqlrelay-binary-distribution-1.4.0.tar.gz &&  \
    cd /opt/  && \
    tar xfz sqlrelay-binary-distribution-1.4.0.tar.gz && \
    rm -f sqlrelay-binary-distribution-1.4.0.tar.gz

# install sqlrelay binary distribution
RUN yum --assumeyes localinstall /opt/sqlrelay-binary-distribution-1.4.0/centos7x64/* && \
    rm -rf /opt/sqlrelay-binary-distribution-1.4.0

# download and extract sqlrelay enterprise modules
RUN yum -y install wget && \
    cd /opt/ && \
	wget http://www.firstworks.com/sqlrenterprise/sqlrelay-enterprise-modules-1.4.0.tar.gz &&  \
    cd /opt/  && \
    tar xfz sqlrelay-enterprise-modules-1.4.0.tar.gz && \
    rm -f sqlrelay-enterprise-modules-1.4.0.tar.gz

# install sqlrelay enterprise modules
RUN yum --assumeyes localinstall /opt/sqlrelay-enterprise-modules-1.4.0/centos7x64/* && \
    rm -rf /opt/sqlrelay-enterprise-modules-1.4.0   

# add MSFT repository, update unixODBC and install msodbcsql17 mssql-tools
RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo > /etc/yum.repos.d/mssql-release.repo && \
    yum install -y unixODBC.x86_64 unixODBC-devel.x86_64 && \
    ACCEPT_EULA=Y yum install -y msodbcsql17 mssql-tools 

ENV ODBCSYSINI /etc
ENV ODBCINI /etc/odbc.ini
ENV PATH /opt/mssql-tools/bin:$PATH

COPY sqlr-entrypoint.sh /bin/sqlr-entrypoint.sh

ENTRYPOINT ["sqlr-entrypoint.sh"]
