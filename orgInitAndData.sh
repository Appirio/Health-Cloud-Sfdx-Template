#!/bin/bash

# Use the healthcloud script to create an org
./healthcloud start


#SFDX DMU plugin: https://github.com/forcedotcom/SFDX-Data-Move-Utility/wiki
#Data Extract from existing org; if needed
#sfdx sfdmu:run --sourceusername HCTrialOrg --targetusername csvfile -p data/sfdmu/

#data load
#May get a prompt while loading: Say "y"
#"yes" command can be used to reply to those prompts; https://www.computerhope.com/unix/yes.htm
yes | sfdx sfdmu:run --sourceusername csvfile --targetusername FSCADK2 -p data/sfdmu/
#Send user password reset email
sfdx force:apex:execute -f config/setup.apex