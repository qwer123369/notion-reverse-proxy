#!/bin/bash
# 参考了 https://blog.51cto.com/manual/1977834
##########################################################
 
#使用curl命令检查http服务器的状态
#-m设置curl不管访问成功或失败，最大消耗的时间为5秒，5秒连接服务为相应则视为无法连接
#-s设置静默连接，不显示连接时的连接速度、时间消耗等信息
#-o将curl下载的页面内容导出到/dev/null(默认会在屏幕显示页面内容)
#-w设置curl命令需要显示的内容%{http_code}，指定curl返回服务器的状态码
check(){
       status_code=$(curl -s -o /dev/null -w %{http_code} --resolve www.notion.so:443:$1 https://www.notion.so )
       if [ $status_code -ne 200 ];then
              status=4
       else
              status=1
       fi
now=`date +%s`
echo $status
url=https://status.jerryw.cn/api/v1/components/$2
echo $url
curl  --url  https://status.jerryw.cn/api/v1/components/$2 \
  --request PUT \
  -H 'X-Cachet-Token: 321321'  \
  -H 'Content-Type: application/json'  \
  -d '{"status": '"$status"'}'
}

check 119.28.13.121 1
check 143.92.45.222 2








   


