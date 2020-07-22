#!/bin/bash

./orgInit.sh

#SFDX DMU plugin: https://github.com/forcedotcom/SFDX-Data-Move-Utility/wiki
#Data Extract from existing org; if needed
#AUthenticate existing org for data extraction
#sfdx force:auth:web:login -a HCTrialOrg
#sfdx sfdmu:run --sourceusername HCTrialOrg --targetusername csvfile -p data/sfdmu/
#sfdx force:data:soql:query -u HCADK -q "Select Id,AccountId,ContactId from AccountContactRelation"

#Cleanup data prior to data load
sfdx force:apex:execute -f config/cleanup.apex
#data load
sfdx sfdmu:run --sourceusername csvfile --targetusername healthcloud -p data/sfdmu/ --noprompt
#Send user password reset email
sfdx force:apex:execute -f config/setup.apex


#delete [select id from Case];
#delete [select id from Contact];
#delete [select id from Account];
#delete [select id from HealthCloudGA__ContactContactRelation__c];
#delete [select id from AccountContactRelation];

