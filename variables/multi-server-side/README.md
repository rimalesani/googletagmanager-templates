# Multi server-side

This variable template lets you store different Google Tag Manager server-side endpoint URLs at the same time, and dynamically assign them to the Google Analytics events, based on certain conditions.<br>
The available conditions are "contains", "match regex" and "equals". You can use a string-formatted value or variable to be checked against them.<br>
For example, you may want to send data to different active server containers based on the event name, hostname, page, country, language or other website and tracking information.<br>
It's also valuable if you're using the same client GTM for multiple environments (like development, staging and production), each of them associated with a different server-container.<br>
An additional plus is the possibility to quickly enable or disable a single server-side endpoint of the list, without having to touch other settings in your GTM, Google Cloud or third-party vendor of the server container deployment. In this way, the disabled server endpoint won't receive any data, leaving you with just the little potential costs of service maintenance.<br><br>

# example

Here the template is used for deploying three different server-side endpoints at the same time, based on the pushed event (the {{Event}} variable is the Condition Value).<br>
The variable looks for "value1", "value2" or "value3" in the event name, and routes the data to the associated server container.<br>
The last endpoint is currently disabled (Enabled = false), meaning the data from "something_value3" event is currently sent client-side.<br>
The Multi server-side variable is then used in the general Events Settings variable of GA4, as the "server_container_url" parameter.<br><br>
![Screenshot 2024-06-21 at 18 40 57](https://github.com/rimalesani/googletagmanager-templates/assets/169257832/20b6732b-2b6b-495f-9e04-9d49acc1bd7e)
