FROM clem109/drone-wechat:latest as build

FROM registry.cn-shanghai.aliyuncs.com/goiot/alpine:latest as get_wlan_ip
COPY --from=build /bin/drone-wechat /bin/drone-wechat
ENV PLUGIN_TITLE "办公室公网IP"
CMD IP=`curl -H "Content-Type: text/html; charset=utf-8" http://2018.ip138.com/ic.asp 2> /dev/null | iconv -f gb2312 -t utf-8| grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"` && env "PLUGIN_DESCRIPTION=$IP" /bin/drone-wechat 
