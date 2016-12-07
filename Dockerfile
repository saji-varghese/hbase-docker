FROM anapsix/alpine-java

RUN apk add --update unzip wget curl docker jq coreutils


ADD download-hbase.sh /tmp/download-hbase.sh
RUN chmod a+x /tmp/download-hbase.sh && sync && /tmp/download-hbase.sh && tar xfz /tmp/hbase-1.2.4-bin.tar.gz -C /opt && rm /tmp/hbase-1.2.4-bin.tar.gz
ADD hbase-site.xml /opt/hbase-1.2.4/conf
ENV PATH $PATH:/opt/hbase-1.2.4/bin

# ZooKeeper
EXPOSE 2181

# HMaster
EXPOSE 60000

# HMaster Web
EXPOSE 60010

# RegionServer
EXPOSE 60020

# RegionServer Web
EXPOSE 60030

ADD start.sh /start.sh
RUN chmod a+x /start.sh

ENTRYPOINT ["/start.sh"]