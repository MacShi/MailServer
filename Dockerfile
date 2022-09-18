FROM couchbase/centos7-systemd
USER root
RUN yum -y install postfix dovecot
RUN echo 1|alternatives --config mta

COPY ./conf/start.sh /root/start.sh
RUN chmod 777 /root/start.sh

# 创建邮箱用户并设置密码
RUN useradd test -s /sbin/nologin
RUN echo -e "Abc@321.\nAbc@321."|passwd test

COPY ./conf/main.cf /etc/postfix/main.cf
COPY ./conf/dovecot.conf /etc/dovecot/dovecot.conf
COPY ./conf/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
COPY ./conf/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
COPY ./conf/10-master.conf /etc/dovecot/conf.d/10-master.conf
COPY ./conf/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf

CMD ["bash","-c","/root/start.sh && tail -f /dev/null"]
