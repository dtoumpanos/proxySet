#!/bin/bash

# proxy address
PROXY="http://PROXY_ADDRESS:PORT"

# command arguments
ARG1=$1
ARG2=$2

# if source ./proxySet.sh set change the $PROXY var in this script
if [[ "$ARG1" == "set" ]]; then
  sed -i "s/^PROXY=\"http\:\/\/.*/PROXY=\"http\:\/\/$ARG2\"/" ./proxy.sh
  echo -e "\n  new proxy is http://"$ARG2"
        - use < source ./proxySet.sh y > to enable \n
  OK"

# if source ./proxySet.sh y run the proxy command
elif [[ "$ARG1" = "y" ]] ; then
  export proxy=$PROXY
  export http_proxy=$PROXY
  export https_proxy=$PROXY
  git config --global http.proxy $PROXY
  git config --global https.proxy $PROXY
  sudo sed -i 's/^#Acquire/Acquire/g' /etc/apt/apt.conf.d/proxy
  echo -e "\n  executed commands:
        - export proxy=$PROXY
        - export http_proxy=$PROXY
        - export https_proxy=$PROXY
        - git config --global http.proxy $PROXY
        - git config --global https.proxy $PROXY
        - sudo sed -i 's/^#Acquire/Acquire/g' /etc/apt/apt.conf.d/proxy \n
  OK"

# if source ./proxySet.sh n revert the changes
elif [[ "$ARG1" = "n" ]] ; then
  unset proxy
  unset http_proxy
  unset https_proxy
  git config --global --unset https.proxy
  git config --global --unset http.proxy
  sudo sed -i 's/^Acquire/#Acquire/g' /etc/apt/apt.conf.d/proxy
  echo -e "\n  executed commands:
        - unset proxy
        - unset http_proxy
        - unset https_proxy
        - git config --global --unset https.proxy
        - git config --global --unset http.proxy
        - sudo sed -i 's/^Acquire/#Acquire/g' /etc/apt/apt.conf.d/proxy \n
  OK"

# in any other case do this
else 
  echo -e "\n  configured proxy is $PROXY \n
  	- use   < source ./proxySet.sh y or no >   to enable or disable proxy for env vars, GIT and apt
	- use < source ./proxySet.sh set PROXY_IP:PORT > to set a new proxy address \n"
fi
