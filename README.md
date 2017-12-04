# AppDynamics Service Availability Monitoring Extension  

This extension monitors availability of multiple services by pinging the service API endpoint every minute. 

If the service is available, 1 is sent to AppDynamics, else 0 is sent to AppDynamics. 

file.txt contains a list of the service endpoints. 

This URL/Service monitoring extension come in handy when you need to monitor service availability and you have not purchased the AppDynamics Server Visibilty License, and you're unable to install JRE or JDK on the server for whatever reason.  Otheriwse use the [offical URL Monitoring extension](https://www.appdynamics.com/community/exchange/extension/url-monitoring-extension/) -  if you have Java installed.  


# Installation 

copy the extension into MACHINE_AGENT_HOME/monitors, make neccessary modifications to suite your environment and/or service endpoints and restart the machine agent. 

