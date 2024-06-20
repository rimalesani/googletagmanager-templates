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
  "displayName": "Multi server-side",
  "description": "Store multiple server-side URLs to be dynamically assigned to GA4 events on certain conditions.\nSelect a variable to match against condition, the condition type and the condition-URL pairs.",
  "categories": ["UTILITY"],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "conditionValue",
    "displayName": "Condition Value",
    "simpleValueType": true,
    "help": "Add text value or text variable to match against the conditions below",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "conditionsSelect",
    "displayName": "Select your condition",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "conditionContains",
        "displayValue": "contains"
      },
      {
        "value": "conditionRegex",
        "displayValue": "match regex"
      },
      {
        "value": "conditionEquals",
        "displayValue": "equals"
      }
    ],
    "simpleValueType": true,
    "help": "Your variable will be checked agains the conditions below by this condition type (string). Default is \"contains\"",
    "defaultValue": "conditionContains"
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "conditionPairs",
    "displayName": "Add your condition-server side URL pairs",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Condition",
        "name": "condition",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Server-side URL",
        "name": "ssideURL",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Enabled",
        "name": "enabled",
        "type": "SELECT",
        "selectItems": [
          {
            "value": "enabledTrue",
            "displayValue": "true"
          },
          {
            "value": "enabledFalse",
            "displayValue": "false"
          }
        ]
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const Conditions = data.conditionPairs;

const mainControl = () => { 
 switch(data.conditionsSelect) {
  case "conditionContains":
    for (var condition of Conditions) {
     if (data.conditionValue.indexOf(condition.condition)!=-1 && 
         condition.enabled=="enabledTrue") return condition.ssideURL; 
    }  
    break; 
  case "conditionRegex":
    for (var condition2 of Conditions) {
     var Regex = "/" + condition2.condition + "/"; 
     //log(Regex); 
     if (data.conditionValue.match(condition2.condition) && 
         condition2.enabled=="enabledTrue") return condition2.ssideURL; 
    }  
    break;  
  case "conditionEquals":
    for (var condition3 of Conditions) {
     if (data.conditionValue==condition3.condition && 
         condition3.enabled=="enabledTrue") return condition3.ssideURL; 
    }  
    break;    
   default:
     return undefined;
 }
};  

return mainControl();


___WEB_PERMISSIONS___

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
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 21/02/2024, 15:17:10


