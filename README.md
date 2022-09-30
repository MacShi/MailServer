# MailServer
## 简介
在容器中使用postfix、dovecot搭建邮件服务器。

## 使用步骤
1. 修改conf/main.cf中myhostname及mydomain两个值
2. 使用` docker build -t mailserver:v1 .`
3. `docker run -itd --privileged -p 25:25 -p 110:110 -p 143:143 --name MailServer mailserver:v1`
4. 配置dns
    - 配置MX记录到mail.YourDomainName
    - 配置TXT记录，通过spf检查v=spf1 ip4:你的IP地址 -all
    - 配置A记录，mail.YourDomainName 、smtp.YourDomainName、pop.YourDomainName到邮件服务器IP地址 
5. 默认创建test(密码：Mail@server1.）用户，可以使用Foxmail直接连接test邮箱进行邮件发送

**注：该配置只能发送邮件，不能接收邮件，具体原因未找到**
