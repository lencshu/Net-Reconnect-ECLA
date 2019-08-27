# 断网自动重连脚本

专门为ECLA公寓网络开发，通过crontab调用任务，每隔3分钟运行一次脚本

痛点:
- 多个设备需要上网
    - Google home mini : 不支持登录验证
    - Raspberry
- 信号覆盖不好
- 经常断线，但是`网络断开重新连接就能恢复`

## crontab简介


基本格式 :


|*　|　*　|　*　|　*　|　*　|　command|
|:---:|:---:|:---:|:---:|:---:|:---:|
|分　|  时　| 日　|  月　|  周　|  命令|
|0~59|0~23|1~31|1~12|0~7|


`,`表示并列
`-`表示范围
`/`表示间隔

cli运行命令

~~~sh
crontab file [-u user]-用指定的文件替代目前的crontab。

crontab-[-u user]-用标准输入替代目前的crontab.

crontab-1[user]-列出用户目前的crontab.

crontab-e[user]-编辑用户目前的crontab.

crontab-d[user]-删除用户目前的crontab.

crontab-c dir- 指定crontab的目录。 
~~~

服务配置

~~~sh
查看crontab服务状态：

service crond status

手动启动crontab服务：

service crond start

查看crontab服务是否已设置为开机启动，执行命令：

ntsysv

加入开机自动启动：

chkconfig –level 35 crond on
~~~


本例：
~~~sh
*/3 * * * * /root/watchDog.sh
~~~




`net.log`

~~~sh
2019-08-20-20:55:40 network est enc***
2019-08-20-21:10:40 network est enc***
2019-08-23-11:07:40 network est enc***
2019-08-23-11:13:40 network est enc***
2019-08-23-11:19:40 network est enc***
2019-08-26-22:01:40 network est enc***
~~~