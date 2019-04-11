#!/bin/bash
#
#       Updated 18/10/2018
#       Block specific ip's attacking the server with iptables

## Defining VARS ##
hour=`date +%H:%M`
now=`date +%d.%m.%Y`
user=USERNAME

## Clean logs older than 15 Days ##
/bin/find /home/$user/ -iname "*IPtables-change*" -mtime +15 -exec rm {} \; > /dev/null 2>&1

attack=`netstat -anp | egrep ":80|SYN" | awk '{print $5}' | awk -F":" '{print $4}'| sort | uniq -c | sort -n | tail -1 | awk '{print $1" "$2}'`
times=`echo $attack | awk '{print $1}'`
ip=`echo $attack | awk '{print $2}'`

## if same IP attacks more than 15 times - reject ##
if [[ $times -gt 15 ]]
then
        ## Create a Directory ##
        if [ ! -d /home/$user/$now-IPtables-Change ]
        then
                mkdir /home/$user/$now-IPtables-Change
        fi
		
        ## Check if exist already in iptables ##
        grep -w $ip /etc/sysconfig/iptables
        if [ $? -eq 0 ]
        then
                ## Add to LOG ##
                echo "$hour $ip already exists in iptables conf" >> /home/$user/$now-IPtables-Change/ips
                exit 1
        else
                ## Add to IPTABLE ##
                text="-A INPUT -s $ip -m tcp -p tcp --dport 80 -j REJECT"
                sed -i "62s/REJECT$/REJECT\n$text/" /etc/sysconfig/iptables
                echo "$hour -  $ip Added to iptables, Found $times Connections to port 80 simultaneously" >> /home/tzahia/$now-IPtables-Change/ips

                ## Reload the IPTABLES service ##
                /sbin/service iptables reload >/dev/null 2>&1 && echo "IPTABLES service reloaded successfully" >> /home/tzahia/$now-IPtables-Change/ips
                exit 0
        fi
fi

