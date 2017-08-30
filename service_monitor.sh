#!/bin/sh

#An AppDynamics machine agent monitoring extension to monitor the availabity of a service/server.

#The script read service/server endpoints from file.txt, then do a curl to the ping endpoint recursively.
#If Success is returned in the JSON response, a metric with the value of 1 is sent to AppDynamics, else a value of 0 is sent to AppDynamics
#When a 0 is recieved, the status on the dasboard changes to red, and it will trigger an pre-configured acton (e.g email alert)

# Sample URL of the services this script was built for is http://host_name.sub.int.com:8080/service_name/ping/v1
# Sample JSON Response:
# {"pingResponse":{"callElapsedTime":X,"location":"host_name.sub.int.com","majorVersion":1,"resourceName":"service_name","resourceType":"XXXX","status":"Success"}}

#TEST#
#I used  https://api.github.com/users/<whatever> to test JSON responses

#DEPENDECIES#
#python  - used for passing JSON response.


#Author israel.ogbole@appdynamics.com
#version 1 : 30/08/2017

#TODO : Add error handling

#read from file
while read -r endpoint; do
#echo $endpoint
host_name=$(sed -E -e 's_.*://([^/@]*@)?([^/:]+).*_\2_' <<< "$endpoint")
#echo $host_name
#strip out .com from the url
server_name=$(cut -d\. -f1 <<< $host_name )
#echo $server_name
#Get service name from the url

service_name=$(awk -F/ '{print $4}' <<< $endpoint ) #get service_name from URL
#echo $service_name
# for added security, store your password in a file, and cat it like this $(cat .password), otherwise password will be visible in bash history
status=$(curl -su username:password $endpoint | python -c "import sys, json; print json.load(sys.stdin)['pingResponse']['status']")
#echo $status

if [ "$status" == "Success" ]; then
  echo "name=Custom Metrics|micro services|$server_name|$service_name, value=1"
else
  echo "name=Custom Metrics|micro services|$server_name|$service_name, value=0"
fi

done < file.txt
