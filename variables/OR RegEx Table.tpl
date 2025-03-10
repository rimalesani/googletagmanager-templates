___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "OR RegEx Table",
  "description": "Simple variable for creating an OR-driven RegEx Table",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "input1",
    "displayName": "First input",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "input2",
    "displayName": "Second input",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "input3",
    "displayName": "Third input",
    "simpleValueType": true
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "conditions",
    "displayName": "Regex/output",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Condition",
        "name": "condition",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Output",
        "name": "output",
        "type": "TEXT"
      }
    ],
    "notSetText": "Required"
  }
]


___SANDBOXED_JS_FOR_SERVER___

const log = require('logToConsole');
const Conditions = data.conditions;
const inputs = [];
if(data.input1) inputs.push(data.input1);
if(data.input2) inputs.push(data.input2);
if(data.input3) inputs.push(data.input3);

//Log the final array
log(inputs);

const mainControl = (arr) => { 
 for (var condition of Conditions) {
     var Regex = "/" + condition.condition + "/"; 
     log(Regex); 
     for (var input of arr) {
         if (input.match(condition.condition)) return condition.output;
     }
 }

};  

return mainControl(inputs);


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 10/03/2025, 12:39:35


