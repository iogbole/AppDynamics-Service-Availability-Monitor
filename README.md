# AppDynamics Service Availability Monitoring Extension in bash  

This extension monitors availability of multiple services by pinging the service API endpoint every minute. 

If the service is available, 1 is sent to AppDynamics, else 0 is sent to AppDynamics. 

file.txt contains a list of the service endpoints. 

This URL/Service monitoring extension come in handy when you need to monitor service availability and you have not purchased the AppDynamics Service Availability License. 

This extension is written in bash. Use  [ URL Monitoring extension](https://www.appdynamics.com/community/exchange/extension/url-monitoring-extension/) if you prefer Java extension. 


# Installation 

copy the extension into MACHINE_AGENT_HOME/monitors, make neccessary modifications to suite your environment and/or service endpoints and restart the machine agent. 

