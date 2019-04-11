# auto_add_rule_FW.sh - Automatic firewall reject ip attacking on port 80 (HTTP)

Last Updated Oct 2018

Block specific ip's attacking the server with iptables

Make the file executable to all
chmod +x ~/auto_add_rule_FW.sh

Usage: put in crontab with:
>> crontab -e
\\ Add to the last line if you want it to run daily every 15 minutes
*/15 * * * * /home/auto_add_rule_FW.sh > /dev/null 2>&1
\\ Save the file and exit

Enjoy
