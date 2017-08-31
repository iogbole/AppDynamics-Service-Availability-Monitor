# AppDynamics Service Availability Monitoring Extension  

This extension monitors availability of multiple services by pinging the service API endpoint every minute. 

If the service is available, 1 is sent to AppDynamics, else 0 is sent to AppDynamics. 

file.txt contains a list of the service endpoints. 

The extension come in handy when you need to monitor service availability and you have not purchased the AppDynamics 
Server Visibilty License. 


# Installation 

copy the extension into MACHINE_AGENT_HOME/monitors, make neccessary modifications to suite your environment and/or service endpoints and restart the machine agent. 

