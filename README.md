# MailServer
## 简介
在容器中使用postfix、dovecot搭建邮件服务器。

## 使用步骤
1. 修改conf/main.cf中myhostname及mydomain两个值
2. 使用docker build -t mailserver:v1 .
3. docker run -itd --privileged -p 25:25 -p 110:110 -p 143:143 --name MailServer 镜像ID

