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
  red "简介：本脚本为Trojan分解安装第二部分（证书申请）"
green "=========================================================="
read -s -n1 -p "若同意上述协议，请按任意键继续 ... "
your_domain=$(cat /etc/nginx/nginx.conf | grep server_name | awk '{ print $2 }' | sed 's/[;]//g')
	green " "
	green " "
	green "=========================================="
	blue "      获取到你的域名为 $your_domain"
	green "=========================================="
	sleep 3s
    green " "
	green " "
	green "=========================================="
	 blue "       安装acme.sh 并开始签发证书"
	green "=========================================="
	sleep 3s
systemctl restart nginx
	curl https://get.acme.sh | sh
	~/.acme.sh/acme.sh --issue -d $your_domain --nginx
	~/.acme.sh/acme.sh --installcert -d $your_domain --key-file /usr/local/etc/trojan/private.key --fullchain-file /usr/local/etc/trojan/cert.crt
	~/.acme.sh/acme.sh --upgrade --auto-upgrade
	chmod -R 755 /usr/local/etc/trojan
if test -s /usr/local/etc/trojan/cert.crt; then
systemctl restart nginx
	green "=========================================="
	 blue "检测到证书文件正常签发"
	 blue "证书文件的目录为 /usr/local/etc/trojan"
	 blue "已经设置证书为自动续签"
	 blue "可以进行第三部分脚本的操作"
	green "=========================================="
else
    green "=================================================="
	  red "未检测到证书文件，本次脚本安装失败"
	  red "每个域名每天、每周、每月均有申请次数限制"
	green "=================================================="  
	 blue "若是证书始终不能正常签发，请尝试手动申请"
	 blue "https://www.youtube.com/watch?v=hWZKbaV3xDk"
	 blue "上面教程 10分50秒 开始有详细的手动申请证书教程"
	green "=================================================="
      red "手动申请证书完成后的操作：" 	
	 blue "1、证书申请下来后请粘贴到/usr/local/etc/trojan目录"
	 blue "2、证书文件改名为 cert.crt "
	 blue "3、秘钥文件改名为 private.key "
	 blue "若完成上述步骤可跳过此脚本并进行第三部分脚本的操作"  
	green "=================================================="
fi
