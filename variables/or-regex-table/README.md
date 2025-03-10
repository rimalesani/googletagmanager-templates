# OR RegEx Table

This server-side GTM variable template allows you to match up to three text or variables inputs against a table of Regular Expression conditions (as you normally do with the default RegEx Table variables).
You can use as many inputs you like (at least one must exist); they are all matched against the conditions by OR logic.
This means, for having meaningful output from the variables, you should have opposite conditions for all the inputs, otherwise the variable’s outcome will come from the first found “input - true condition” pair. 
example

Here the template is used for checking the Origin OR the Referer HTTP headers (of the incoming tracking request) against the allowed domain.
The OR condition is needed because any of them can be missing (for example if the request is made via service workers).
Based on that, the variable outputs true or false and we can use it for building conditional logic in our server-side GTM container, for example with the goal of routing data to different endpoints or block some tags.


![image](https://github.com/user-attachments/assets/9f6526ee-c3ed-43e5-ba19-ad00ed257a2a)
