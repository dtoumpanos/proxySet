#
# author: dimitrios.toumpanos@gmail.com
# date: 10/30/2021
# version 1.0
#

	PROBLEM SOLVED WITH THIS TOOL:
		I should modify the proxy settings on my laptop every day in order to work in my corporate or my home network.
                This tool is doing the job for me automatically.
	
        DESCRIPTION:
                bash script
                use this script to enable or disable proxy on an Ubuntu linux OS 
		maybe working on other Linux distribution - (not tested)

		The script sets or unsets the proxy for curl, wget, apt, git etc
		The bellow commands are use:
			- export proxy=http://PROXY_ADDRESS:PORT
        		- export http_proxy=http://PROXY_ADDRESS:PORT
        		- export https_proxy=http://PROXY_ADDRESS:PORT
        		- git config --global http.proxy http://PROXY_ADDRESS:PORT
        		- git config --global https.proxy http://PROXY_ADDRESS:PORT
        		- sudo sed -i 's/^#Acquire/Acquire/g' /etc/apt/apt.conf.d/proxy

        USAGE:
               ./proxy.sh  --> read the instructions
                source ./proxySet.sh set PROXY_IP:PORT --> set a new proxy address
                source ./proxySet.sh y --> enable the correct configured proxy
                source ./proxySet.sh n --> disable the correct configured proxy

        INSTALLATION:
                - git clone the project
                - cd in the folder
                - chmod +x ./proxySet.sh
                - ./proxySet.sh
