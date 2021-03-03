# Http-Brute-Blocker 

Auto Blocker for HTTP (port 80) brute force attacks
Created: Oct 2018
Updated: Mar 2021

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

- unix based working env
- text editor
- Make sure you don't have firewalld installed and running, if you do follow the below link
- iptables-services package (Use - https://linuxize.com/post/how-to-install-iptables-on-centos-7/)
- net-tools package (yum install net-tools)
- A service running on port 80 (nginx/httpd etc...)


### Installing

1. Cloning the project to you local workstation:

```
git clone git@github.com:zakarel/http-brute-blocker
```

## Configuration

- Changing the number of attacks before a block occures and logged
```
if [[ $times -gt 15 ]] ## Change from 15 to some number
```

## Making the File executable

```
chmod +x auto_add_rule_FW.sh
```
## Running the script

```
./auto_add_rule_FW.sh
```

## Running the script regularly

Usage: put in crontab with:

```
>> crontab -e
\\ Add to the last line if you want it to run daily every 15 minutes
*/15 * * * * /home/auto_add_rule_FW.sh > /dev/null 2>&1
\\ Save the file and exit
```
## Authors

* **Tzahi Ariel** - *Initial work* - [zakarel](https://github.com/zakarel)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
