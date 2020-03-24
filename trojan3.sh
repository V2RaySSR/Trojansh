#!/bin/bash
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
clear
green "=========================================================="
 blue "支持：centos7+/debian9+/ubuntu16.04+"
 blue "网站：www.v2rayssr.com （已开启禁止国内访问）"
 blue "YouTube频道：波仔分享"
 blue "本脚本禁止在国内网站转载"
green "=========================================================="
  red "简介：本脚本为Trojan分解安装第三部分（Trojan服务器配置）"
green "=========================================================="
read -s -n1 -p "若同意上述协议，请按任意键继续 ... "
trojan_passwd=$(cat /dev/urandom | head -1 | md5sum | head -c 8)
your_domain=$(cat /etc/nginx/nginx.conf | grep server_name | awk '{ print $2 }' | sed 's/[;]//g')
cat > /usr/local/etc/trojan/config.json <<-EOF
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": 443,
    "remote_addr": "127.0.0.1",
    "remote_port": 80,
    "password": [
        "$trojan_passwd"
    ],
    "log_level": 1,
    "ssl": {
        "cert": "/usr/local/etc/trojan/cert.crt",
        "key": "/usr/local/etc/trojan/private.key",
        "key_password": "",
        "cipher": "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384",
        "cipher_tls13": "TLS_AES_128_GCM_SHA256:TLS_CHACHA20_POLY1305_SHA256:TLS_AES_256_GCM_SHA384",
        "prefer_server_cipher": true,
        "alpn": [
            "http/1.1"
        ],
        "alpn_port_override": {
            "h2": 81
        },
        "reuse_session": true,
        "session_ticket": false,
        "session_timeout": 600,
        "plain_http_response": "",
        "curves": "",
        "dhparam": ""
    },
    "tcp": {
        "prefer_ipv4": false,
        "no_delay": true,
        "keep_alive": true,
        "reuse_port": false,
        "fast_open": false,
        "fast_open_qlen": 20
    },
    "mysql": {
        "enabled": false,
        "server_addr": "127.0.0.1",
        "server_port": 3306,
        "database": "trojan",
        "username": "trojan",
        "password": ""
    }
}
EOF
systemctl restart trojan

cat > /usr/local/etc/trojan/配置.txt <<-EOF

==========================================================

支持：centos7+/debian9+/ubuntu16.04+
网站：www.v2rayssr.com （已开启禁止国内访问）
YouTube频道：波仔分享

==========================================================

你的Trojan配置信息为：

	域名：$your_domain
	密码：$trojan_passwd
	端口：443

==========================================================

若需修改密码或忘记密码

	请访问VPS: /usr/local/etc/trojan/config.json

==========================================================

推荐Win客户端下载：https://www.v2rayssr.com/trojanwin.html

推荐安卓客户端软件：https://github.com/apache/ignite/releases

MacOS和IOS太高端，请自行选择 Trojan 客户端

	
==========================================================
	
若你想搭建多用户的Trojan

	请访问：https://youtu.be/hb7WabtgfTo
	
==========================================================



EOF
reset
	green ""
	green "================================================================="
	 blue "Trojan服务器配置完成"
	 blue "现在可以尝试访问 https://$your_domain"
	 blue "检查证书是否有效及正确配置"
    green "=================================================================="
	sleep 4s 
	  red "======================请详细阅读下面的说明========================"
	green "=================================================================="
	 blue "Chrome浏览器地址栏前面若没有小锁，Trojan服务绝对不成功"
	 blue "Chrome浏览器若是有小锁，Trojan服务绝对正常"
	 blue "若是客户端不能连接Trojan,请尝试重启Trojan服务"
	 blue "Trojan服务重启命令：systemctl restart trojan"
	green "=================================================================="
	sleep 2s
	green "=================================================================="
	 blue "你的Trojan配置信息存放在：/usr/local/etc/trojan/配置.txt"
	green "=================================================================="
	green "=================================================================="
	sleep 2s
	 blue "你的Trojan配置信息为："
	 blue "域名：$your_domain"
	 blue "密码：$trojan_passwd"
	 blue "端口：443"
	 blue "若需修改密码或忘记密码"
	 blue "请访问VPS: /usr/local/etc/trojan/config.json"
	 blue "推荐Win客户端下载：https://www.v2rayssr.com/trojanwin.html"
	 blue "推荐安卓客户端软件：https://github.com/apache/ignite/releases"
	 blue "MacOS和IOS太高端，请自行选择 Trojan 客户端 "
	green "=================================================================="
